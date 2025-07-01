//
//  SectionEpisodeDTOMapper.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/1/25.
//

import Foundation

struct SectionContentEpisodeDTOMapper: Mapper {
    typealias From = SectionContent
    typealias To = EpisodeDTO
    
    static func map(_ from: SectionContent) -> EpisodeDTO {
        return EpisodeDTO(
            podcastPopularityScore: from.podcastPopularityScore ?? 0,
            podcastPriority: from.podcastPriority ?? 0,
            episodeID: from.episodeID ?? "",
            name: from.name ?? "",
            seasonNumber: from.seasonNumber,
            episodeType: from.episodeType ?? "",
            podcastName: from.podcastName ?? "",
            authorName: from.authorName ?? "",
            description: from.description ?? "",
            number: from.number,
            duration: from.duration ?? 0,
            avatarURL: from.avatarURL ?? "",
            separatedAudioURL: from.separatedAudioURL ?? "",
            audioURL: from.audioURL ?? "",
            releaseDate: from.releaseDate ?? "",
            podcastID: from.podcastID ?? "",
            chapters: from.chapters ?? [],
            paidIsEarlyAccess: from.paidIsEarlyAccess ?? false,
            paidIsNowEarlyAccess: from.paidIsNowEarlyAccess ?? false,
            paidIsExclusive: from.paidIsExclusive ?? false,
            paidTranscriptURL: from.paidTranscriptURL,
            freeTranscriptURL: from.freeTranscriptURL,
            paidEarlyAccessAudioURL: from.paidEarlyAccessAudioURL,
            paidIsExclusivePartially: from.paidIsExclusivePartially ?? false,
            paidExclusiveStartTime: from.paidExclusiveStartTime ?? 0,
            paidEarlyAccessDate: from.paidEarlyAccessDate ?? Date(),
            paidExclusivityType: from.paidExclusivityType,
            score: from.score ?? 0
        )
            
         
    }
}
