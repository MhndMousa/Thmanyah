//
//  APIClientError.swift
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
