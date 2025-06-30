//
//  AudioBookModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//


import Foundation

// MARK: - AudioBookModel
struct AudioBookDTO: Codable, Identifiable {
    var id: String {
        audiobookID
    }
    let audiobookID, name, authorName, description: String
    let avatarURL: String
    let duration: Int
    let language: String
    let releaseDate: String
    let score: Double
}

extension AudioBookDTO {
    static func map(from model: SectionContent) -> AudioBookDTO {
        return AudioBookDTO(
            audiobookID: model.audiobookID ?? "",
            name: model.name ?? "",
            authorName: model.authorName ?? "",
            description: model.description ?? "",
            avatarURL: model.avatarURL ?? "",
            duration: model.duration ?? 0,
            language: model.language ?? "",
            releaseDate: model.releaseDate ?? "",
            score: model.score ?? 0
        )
    }
}
