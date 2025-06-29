//
//  AudioBookModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//


import Foundation

// MARK: - AudioBookModel
struct AudioBookModel: Codable {
    let audiobookID, name, authorName, description: String
    let avatarURL: String
    let duration: Int
    let language: String
    let releaseDate: Date
    let score: Int

}
