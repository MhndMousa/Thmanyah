//
//  HomeModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation

// MARK: - HomeModel
struct PodcastDTO: Codable, Identifiable  {
    var id: String {
        podcastID
    }
    
    let podcastID, name, description: String
    let avatarURL: String
    let episodeCount, duration: Int
    let language: String
    let priority, popularityScore: Int
    let score: Double

}

extension PodcastDTO: Mockable {
    static func mock() -> PodcastDTO {
        .init(podcastID: .random(),
              name: .random(),
              description: .random(),
              avatarURL: Mock.imageUrl,
              episodeCount: .random(),
              duration: .random(),
              language: .random(),
              priority: .random(),
              popularityScore: .random(),
              score: .random(),
        )
    }
}

extension PodcastDTO: SquareViewPreviewable, TwoLineViewPreviewable, BigSquareViewPreviewable {
    var text: String { name }
    var datePosted: Date { Date() } // TODO: ??
    var length: Int { duration }
    var imageUrlString: String { avatarURL }
    
    
    var title: String { name }
    var subtitle: String { description }
    
}
