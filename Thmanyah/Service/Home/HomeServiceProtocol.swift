//
//  HomeServiceProtocol.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//


protocol HomeServiceProtocol {
    func fetchHomeData() async throws -> HomeModel
}

