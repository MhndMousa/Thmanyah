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

extension EpisodeDTO: SquareViewPreviewable, TwoLineViewPreviewable, BigSquareViewPreviewable {
    var text: String { name }
    var datePosted: Date { Date() } // TODO: ??
    var length: Int { duration }
    var imageUrlString: String { avatarURL }
    
    
    var title: String { name }
    var subtitle: String { description }
    
}
