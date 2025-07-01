//
//  SectionPodcastDTOMapper.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/1/25.
//


struct SectionContentPodcastDTOMapper: Mapper {
    typealias From = SectionContent
    typealias To = PodcastDTO
    
    static func map(_ from: SectionContent) -> PodcastDTO {
        return PodcastDTO(
            podcastID: from.podcastID ?? "",
            name: from.name ?? "",
            description: from.description ?? "",
            avatarURL: from.avatarURL ?? "",
            episodeCount: from.episodeCount ?? 0,
            duration: from.duration ?? 0,
            language: from.language ?? "",
            priority: from.priority ?? 0,
            popularityScore: from.popularityScore ?? 0,
            score: from.score ?? 0
        )
    }
}
