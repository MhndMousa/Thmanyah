//
//  APIRequest.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation

protocol APIRequest<ResponseType>: Encodable where ResponseType: APIResponse {
    associatedtype ResponseType
    
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
}
