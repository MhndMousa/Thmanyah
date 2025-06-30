//
//  AudioBookModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//


import Foundation

// MARK: - AudioBookModel
struct AudioBookDTO: Codable {
    let audiobookID, name, authorName, description: String
    let avatarURL: String
    let duration: Int
    let language: String
    let releaseDate: Date
    let score: Int
}

extension AudioBookDTO {
    static func map(from model: SectionContent) -> AudioBookDTO {
        .init(
            audiobookID: model.audiobookID ?? "",
            name: model.name ?? "",
            authorName: model.authorName ?? "",
            description: model.description ?? "",
            avatarURL: model.avatarURL ?? "",
            duration: model.duration ?? 0,
            language: model.language ?? "",
            releaseDate: model.releaseDate ?? Date(),
            score: model.score ?? 0
        )
    }
}
