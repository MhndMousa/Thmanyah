//
//  HomeModel 2.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation

// MARK: - HomeModel
struct EpisodeDTO: Codable {
    let podcastPopularityScore, podcastPriority: Int
    let episodeID, name: String
    let seasonNumber: Int?
    let episodeType, podcastName, authorName, description: String
    let number: Int?
    let duration: Int
    let avatarURL: String
    let separatedAudioURL: String
    let audioURL: String
    let releaseDate, podcastID: String
    let chapters: [String]
    let paidIsEarlyAccess, paidIsNowEarlyAccess, paidIsExclusive: Bool
    let paidTranscriptURL, freeTranscriptURL, paidEarlyAccessAudioURL: String?
    let paidIsExclusivePartially: Bool
    let paidExclusiveStartTime: Int
    let paidEarlyAccessDate: Date
    let paidExclusivityType: String?
    let score: Double
}

extension EpisodeDTO {
    static func map(from content: SectionContent) -> Self {
        .init(
            podcastPopularityScore: content.podcastPopularityScore ?? 0,
            podcastPriority: content.podcastPriority ?? 0,
            episodeID: content.episodeID ?? "",
            name: content.name ?? "",
            seasonNumber: content.seasonNumber,
            episodeType: content.episodeType ?? "",
            podcastName: content.podcastName ?? "",
            authorName: content.authorName ?? "",
            description: content.description ?? "",
            number: content.number,
            duration: content.duration ?? 0,
            avatarURL: content.avatarURL ?? "",
            separatedAudioURL: content.separatedAudioURL ?? "",
            audioURL: content.audioURL ?? "",
            releaseDate: content.releaseDate ?? "",
            podcastID: content.podcastID ?? "",
            chapters: content.chapters ?? [],
            paidIsEarlyAccess: content.paidIsEarlyAccess ?? false,
            paidIsNowEarlyAccess: content.paidIsNowEarlyAccess ?? false,
            paidIsExclusive: content.paidIsExclusive ?? false,
            paidTranscriptURL: content.paidTranscriptURL,
            freeTranscriptURL: content.freeTranscriptURL,
            paidEarlyAccessAudioURL: content.paidEarlyAccessAudioURL,
            paidIsExclusivePartially: content.paidIsExclusivePartially ?? false,
            paidExclusiveStartTime: content.paidExclusiveStartTime ?? false,
            paidEarlyAccessDate: content.paidEarlyAccessDate ?? false,
            paidExclusivityType: content.paidExclusivityType,
            score: content.score ?? 0
        )
            
            
            
    }
    
}

extension EpisodeDTO:  Mockable {
    static func mock() -> EpisodeDTO {
        .init(
            podcastPopularityScore:  1,
            podcastPriority:  1,
            episodeID:  "test",
            name: "test",
            seasonNumber: 5,
            episodeType: "test",
            podcastName: "test",
            authorName: "test",
            description: "test",
            number: 41,
            duration: 1,
            avatarURL: "test",
            separatedAudioURL: "test",
            audioURL: "test",
            releaseDate: "test",
            podcastID: "test",
            chapters: [],
            paidIsEarlyAccess: false,
            paidIsNowEarlyAccess: false,
            paidIsExclusive: false,
            paidTranscriptURL: "demo",
            freeTranscriptURL: "demo",
            paidEarlyAccessAudioURL: "demo",
            paidIsExclusivePartially: true,
            paidExclusiveStartTime: 1,
            paidEarlyAccessDate: Date(),
            paidExclusivityType: "demo",
            score: 254)
    }
}
