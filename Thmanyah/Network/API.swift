//
//  API.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation

class APIClient: APIClientProtocol {
    private var client : URLSession
    private var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    init(client: URLSession) {
        self.client = client
    }
    
    func send<TRequest, TResponse>(_ request: TRequest) async throws(APIClientError) -> TResponse where TRequest : APIRequest, TResponse == TRequest.ResponseType.Model {
        
        guard let url = URL(string: request.path) else { throw .invalidURL } // TODO: Add error handling?
        

        
        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = request.method.rawValue
            
            if let header = request.headers {
                urlRequest.allHTTPHeaderFields = header
            }
            
            if let body = request.body {
                let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
                urlRequest.httpBody = jsonData
            }
            
            let (data, response) = try await client.data(for: urlRequest)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
            
            let decodedResponse = try jsonDecoder.decode(TResponse.self, from: data)
            
            return decodedResponse
            
        } catch {
            throw(.unknown(error))
        }
    }
    
}
