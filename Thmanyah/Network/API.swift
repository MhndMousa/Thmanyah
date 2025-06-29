//
//  API.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation

enum APIClientError: Error {
    case invalidURL
    case decodingFailed
    case unknown(Error)
}

protocol APIClientProtocol {
    func send<TRequest,TResponse>(_ request: TRequest) async throws(APIClientError) -> TResponse where TRequest:  APIRequest,
                                                                                       TResponse == TRequest.ResponseType
}

class APIClient: APIClientProtocol {
    private var client : URLSession
    
    init(client: URLSession) {
        self.client = client
    }
    
    func send<TRequest, TResponse>(_ request: TRequest) async throws(APIClientError) -> TResponse where TRequest : APIRequest, TResponse == TRequest.ResponseType {
        
        guard let url = URL(string: request.path) else { throw .invalidURL } // TODO: Add error handling?
        

        
        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = request.method.rawValue
            
            if let header = request.headers {
                urlRequest.allHTTPHeaderFields = request.headers
            }
            
            if let body = request.body {
                let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
                urlRequest.httpBody = jsonData
            }
            
            let (data, response) = try await client.data(for: urlRequest)
            guard let decodedResponse = try? JSONDecoder().decode(TResponse.self, from: data) else { throw APIClientError.decodingFailed }
            
            return decodedResponse
            
        } catch {
            throw(.unknown(error))
        }
    }
    
}
