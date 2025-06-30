//
//  SectionDTO.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

class SectionDTO<T> {
    var name: String
    var type: SectionDTOType
    var contentType: SectionDTOContentType
    var order: Int
    var items: [T]
    
    convenience init(section: Section){
        self.init(
            name: section.name,
            type: .init(rawValue: section.type)!, // TODO: Remove forcecase
            contentType: .init(rawValue: section.contentType)!, // TODO: Remove forcecase
            order: section.order,
            items: section.content
        )
    }
    
    
    init(name: String, type: SectionDTOType, contentType: SectionDTOContentType, order: Int, items: [SectionContent]) {
        self.name = name
        self.type = type
        self.contentType = contentType
        self.order = order
        switch contentType {
        case .podcast:
            self.items = items.map{ PodcastDTO.map(from: $0) as! T }
        case .episode:
            self.items = items.map{ EpisodeDTO.map(from: $0) as! T }
        case .audioBook:
            self.items = items.map{ AudioBookDTO.map(from: $0) as! T }
        case .audioArticle:
            self.items = items.map{ AudioArticleDTO.map(from: $0) as! T }   
        }
    }
    
    static func placeholder(contentType: SectionDTOContentType) -> SectionDTO<T> {
        .init(name: "", type: .square, contentType: contentType, order: 0, items: [.init(podcastPopularityScore: 0, podcastPriority: 0, episodeID: "", name: "", seasonNumber: 0, episodeType: "", podcastName: "", authorName: "", description: "", number: 0, duration: 0, avatarURL: "", separatedAudioURL: "", audioURL: "", releaseDate: "", podcastID: "", chapters: [], paidIsEarlyAccess: nil, paidIsNowEarlyAccess: nil, paidIsExclusive: nil, paidTranscriptURL: "", freeTranscriptURL: "", paidEarlyAccessAudioURL: "", paidIsExclusivePartially: nil, paidExclusiveStartTime: 0, paidEarlyAccessDate: nil, paidExclusivityType: "", score: 0, audiobookID: "", language: "", episodeCount: 0, priority: 0, popularityScore: 0)])
    }
}

enum SectionDTOContentType: String, Codable {
    case podcast = "podcast"
    case episode = "episode"
    case audioBook = "audio_book"
    case audioArticle = "audio_article"
}

enum SectionDTOType: String, Codable {
    case square = "square"
    case twoLinesGrid = "2_lines_grid"
    case bigSquare = "big_square"
    case bigSquare2 = "big square"
    case queue = "queue"
}
