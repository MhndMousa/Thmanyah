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

extension PodcastDTO {
    static func map(from content: SectionContent) -> PodcastDTO {
        return PodcastDTO(
            podcastID: content.podcastID ?? "",
            name: content.name ?? "",
            description: content.description ?? "",
            avatarURL: content.avatarURL ?? "",
            episodeCount: content.episodeCount ?? 0,
            duration: content.duration ?? 0,
            language: content.language ?? "",
            priority: content.priority ?? 0,
            popularityScore: content.popularityScore ?? 0,
            score: content.score ?? 0
        )
    }
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
