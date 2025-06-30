//
//  HomeModel 2.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation

// MARK: - HomeModel
struct EpisodeDTO: Codable, Identifiable {
    var id: String {
        episodeID
    }
    
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
    static func map(from content: SectionContent) -> EpisodeDTO {
        return EpisodeDTO(
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
            paidExclusiveStartTime: content.paidExclusiveStartTime ?? 0,
            paidEarlyAccessDate: content.paidEarlyAccessDate ?? Date(),
            paidExclusivityType: content.paidExclusivityType,
            score: content.score ?? 0
        )
            
            
            
    }
    
}

extension EpisodeDTO:  Mockable {
    static func mock() -> EpisodeDTO {
        .init(
            podcastPopularityScore: .random(),
            podcastPriority: .random(),
            episodeID:  .random(),
            name: .random(),
            seasonNumber: 5,
            episodeType: .random(),
            podcastName: .random(),
            authorName: .random(),
            description: .random(),
            number: .random(),
            duration:.random(),
            avatarURL: .random(),
            separatedAudioURL: .random(),
            audioURL: .random(),
            releaseDate: .random(),
            podcastID: .random(),
            chapters: [],
            paidIsEarlyAccess: false,
            paidIsNowEarlyAccess: false,
            paidIsExclusive: false,
            paidTranscriptURL: .random(),
            freeTranscriptURL: .random(),
            paidEarlyAccessAudioURL: .random(),
            paidIsExclusivePartially: true,
            paidExclusiveStartTime: .random(),
            paidEarlyAccessDate: Date(),
            paidExclusivityType: .random(),
            score: .random())
    }
}
