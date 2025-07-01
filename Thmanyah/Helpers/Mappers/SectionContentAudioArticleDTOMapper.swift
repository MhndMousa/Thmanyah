//
//  SectionAudioArticleDTOMapper.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/1/25.
//


struct SectionContentAudioArticleDTOMapper: Mapper {
    typealias From = SectionContent
    typealias To = AudioArticleDTO
    
    static func map(_ from: SectionContent) -> AudioArticleDTO {
        AudioArticleDTO(
            audiobookID: from.audiobookID ?? "",
            name: from.name ?? "",
            authorName: from.authorName ?? "",
            description: from.description ?? "",
            avatarURL: from.avatarURL ?? "",
            duration: from.duration ?? 0,
            language: from.language ?? "",
            releaseDate: from.releaseDate ?? "",
            score: from.score ?? 0
        )
    }
}
