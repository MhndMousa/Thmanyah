//
//  APIResponse.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//


protocol APIResponse: Decodable where Model: Decodable {
    associatedtype Model
}
