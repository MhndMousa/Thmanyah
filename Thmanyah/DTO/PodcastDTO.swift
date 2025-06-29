//
//  HomeModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

// MARK: - HomeModel
struct PodcastDTO: Codable {
    let podcastID, name, description: String
    let avatarURL: String
    let episodeCount, duration: Int
    let language: String
    let priority, popularityScore: Int
    let score: Double

}
