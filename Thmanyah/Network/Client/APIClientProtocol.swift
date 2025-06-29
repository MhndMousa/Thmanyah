//
//  APIClientProtocol.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation

protocol APIClientProtocol {
    func send<TRequest,TResponse>(_ request: TRequest) async throws(APIClientError) -> TResponse where TRequest: APIRequest, TResponse == TRequest.ResponseType.Model
}
