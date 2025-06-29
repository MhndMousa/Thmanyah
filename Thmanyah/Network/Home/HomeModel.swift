//
//  HomeModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let homeModel = try? JSONDecoder().decode(HomeModel.self, from: jsonData)

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let homeModel = try? JSONDecoder().decode(HomeModel.self, from: jsonData)

import Foundation

// MARK: - HomeModel
struct HomeModel: Codable {
    let sections: [Section]
    let pagination: Pagination
}

// MARK: - Pagination
struct Pagination: Codable {
    let nextPage: String
    let totalPages: Int

}

// MARK: - Section
struct Section: Codable {
    let name: String
    let type: String
    let contentType: String
    let order: Int
    let content: [SectionContent]
}

// MARK: - Content
struct SectionContent: Codable {
    
    let podcastPopularityScore, podcastPriority: Int?
    let episodeID, name: String?
    let seasonNumber: Int?
    let episodeType, podcastName, authorName, description: String?
    let number: Int?
    let duration: Int?
    let avatarURL: String?
    let separatedAudioURL: String?
    let audioURL: String?
    let releaseDate, podcastID: String?
    let chapters: [String?]?
    let paidIsEarlyAccess, paidIsNowEarlyAccess, paidIsExclusive: Bool?
    let paidTranscriptURL, freeTranscriptURL, paidEarlyAccessAudioURL: String?
    let paidIsExclusivePartially: Bool?
    let paidExclusiveStartTime: Int?
    let paidEarlyAccessDate: Date?
    let paidExclusivityType: String?
    let score: Double?
    
    let audiobookID: String?
    let language: String?
    
    
    let episodeCount: Int?
    
    let priority, popularityScore: Int?
    
    enum CodingKeys: String, CodingKey {
        case podcastPopularityScore = "podcastPopularityScore"
        case podcastPriority = "podcastPriority"
        case episodeID = "episode_id"
        case name
        case seasonNumber = "season_number"
        case episodeType = "episode_type"
        case podcastName = "podcast_name"
        case authorName = "author_name"
        case description = "description"
        case number
        case duration
        case avatarURL = "avatar_url"
        case separatedAudioURL = "separated_audio_url"
        case audioURL = "audio_url"
        case releaseDate = "release_date"
        case podcastID = "podcast_id"
        case chapters
        case paidIsEarlyAccess = "paid_is_early_access"
        case paidIsNowEarlyAccess = "paid_is_now_early_access"
        case paidIsExclusive = "paid_is_exclusive"
        case paidTranscriptURL = "paid_transcript_url"
        case freeTranscriptURL = "free_transcript_url"
        case paidEarlyAccessAudioURL = "paid_early_access_audio_url"
        case paidIsExclusivePartially = "paid_is_exclusive_partially"
        case paidExclusiveStartTime = "paid_exclusive_start_time"
        case paidEarlyAccessDate = "paid_early_access_date"
        case paidExclusivityType = "paid_exclusivity_type"
        case score
        case audiobookID = "audiobook_id"
        case language
        case episodeCount = "episode_count"
        case priority
        case popularityScore = "popularityScore"
    }
}
