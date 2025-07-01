//
//  AudioArticleModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//


import Foundation

// MARK: - AudioArticleModel
struct AudioArticleDTO: Codable, Identifiable {
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

extension AudioArticleDTO: SquareViewPreviewable, TwoLineViewPreviewable, BigSquareViewPreviewable {
    var text: String { name }
    var datePosted: Date { Date() } // TODO: ??
    var length: Int { duration }
    var imageUrlString: String { avatarURL }
    
    
    var title: String { name }
    var subtitle: String { description }
    
}
