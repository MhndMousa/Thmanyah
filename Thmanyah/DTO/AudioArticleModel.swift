//
//  AudioArticleModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//


import Foundation

// MARK: - AudioArticleModel
struct AudioArticleModel: Codable {
    let audiobookID, name, authorName, description: String
    let avatarURL: String
    let duration: Int
    let language: String
    let releaseDate: Date
    let score: Int
}


//// MARK: - ConentType
//enum ContentType: String, Codable {
//    case podcast = "podcast"
//    case episode = "episode"
//    case audioBook = "audio_book"
//    case audioArticle = "audio_article"
//}
//
//enum ContentViewType: String, Codable {
//    case square = "square"
//    case twoLinesGrid = "2_lines_grid"
//    case bigSquare = "big_square"
//    case queue = "queue"
//}
