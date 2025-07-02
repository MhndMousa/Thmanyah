//
//  HomeModel+Stub.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/2/25.
//
import Foundation
@testable import Thmanyah

extension HomeModel {
    enum StubFactory {
        static func stub() -> HomeModel {
            let sections: [Section] = [
                .init(name: "Top Podcasts", type: SectionDTOType.square.rawValue, contentType: SectionDTOContentType.podcast.rawValue, order: 1, content: [
                    .init(podcastPopularityScore: 100, podcastPriority: 1, episodeID: "1", name: "Podcast 1", seasonNumber: 1, episodeType: "regular", podcastName: "Test Podcast", authorName: "Test Author", description: "Test Description", number: 1, duration: 1800, avatarURL: "https://example.com/podcast1.jpg", separatedAudioURL: "", audioURL: "", releaseDate: "2024-01-01", podcastID: "podcast1", chapters: [], paidIsEarlyAccess: false, paidIsNowEarlyAccess: false, paidIsExclusive: false, paidTranscriptURL: nil, freeTranscriptURL: nil, paidEarlyAccessAudioURL: nil, paidIsExclusivePartially: false, paidExclusiveStartTime: 0, paidEarlyAccessDate: Date(), paidExclusivityType: nil, score: 4.5, audiobookID: nil, language: "en", episodeCount: 10, priority: 1, popularityScore: 100)
                ]),
                .init(name: "Trending Podcasts", type: SectionDTOType.twoLinesGrid.rawValue, contentType: SectionDTOContentType.episode.rawValue, order: 2, content: [
                    .init(podcastPopularityScore: 90, podcastPriority: 2, episodeID: "3", name: "Trending Podcast 1", seasonNumber: 1, episodeType: "regular", podcastName: "Trending Podcast", authorName: "Trending Author", description: "Trending Description", number: 1, duration: 3600, avatarURL: "https://example.com/trending1.jpg", separatedAudioURL: "", audioURL: "", releaseDate: "2024-01-01", podcastID: "trending1", chapters: [], paidIsEarlyAccess: false, paidIsNowEarlyAccess: false, paidIsExclusive: false, paidTranscriptURL: nil, freeTranscriptURL: nil, paidEarlyAccessAudioURL: nil, paidIsExclusivePartially: false, paidExclusiveStartTime: 0, paidEarlyAccessDate: Date(), paidExclusivityType: nil, score: 4.3, audiobookID: nil, language: "en", episodeCount: 5, priority: 2, popularityScore: 90)
                ]),
                .init(name: "Best Selling Audiobooks", type: SectionDTOType.square.rawValue, contentType: SectionDTOContentType.audioBook.rawValue, order: 3, content: [
                    .init(podcastPopularityScore: nil, podcastPriority: nil, episodeID: nil, name: "Audiobook 1", seasonNumber: nil, episodeType: nil, podcastName: nil, authorName: "Audiobook Author", description: "Audiobook Description", number: nil, duration: 7200, avatarURL: "https://example.com/audiobook1.jpg", separatedAudioURL: nil, audioURL: nil, releaseDate: "2024-01-01", podcastID: nil, chapters: nil, paidIsEarlyAccess: nil, paidIsNowEarlyAccess: nil, paidIsExclusive: nil, paidTranscriptURL: nil, freeTranscriptURL: nil, paidEarlyAccessAudioURL: nil, paidIsExclusivePartially: nil, paidExclusiveStartTime: nil, paidEarlyAccessDate: nil, paidExclusivityType: nil, score: 4.7, audiobookID: "audiobook1", language: "en", episodeCount: nil, priority: 3, popularityScore: 85)
                ]),
                .init(name: "Must Read Audio Articles", type: SectionDTOType.twoLinesGrid.rawValue, contentType: SectionDTOContentType.audioArticle.rawValue, order: 4, content: [
                    .init(podcastPopularityScore: nil, podcastPriority: nil, episodeID: nil, name: "Article 1", seasonNumber: nil, episodeType: nil, podcastName: nil, authorName: "Article Author", description: "Article Description", number: nil, duration: 900, avatarURL: "https://example.com/article1.jpg", separatedAudioURL: nil, audioURL: nil, releaseDate: "2024-01-01", podcastID: nil, chapters: nil, paidIsEarlyAccess: nil, paidIsNowEarlyAccess: nil, paidIsExclusive: nil, paidTranscriptURL: nil, freeTranscriptURL: nil, paidEarlyAccessAudioURL: nil, paidIsExclusivePartially: nil, paidExclusiveStartTime: nil, paidEarlyAccessDate: nil, paidExclusivityType: nil, score: 4.2, audiobookID: "article1", language: "en", episodeCount: nil, priority: 4, popularityScore: 75)
                ]),
                .init(name: "New Podcasts", type: SectionDTOType.square.rawValue, contentType: SectionDTOContentType.podcast.rawValue, order: 5, content: [
                    .init(podcastPopularityScore: 80, podcastPriority: 5, episodeID: "9", name: "New Podcast 1", seasonNumber: 1, episodeType: "regular", podcastName: "New Podcast", authorName: "New Author", description: "New Description", number: 1, duration: 2100, avatarURL: "https://example.com/new1.jpg", separatedAudioURL: "", audioURL: "", releaseDate: "2024-01-01", podcastID: "new1", chapters: [], paidIsEarlyAccess: false, paidIsNowEarlyAccess: false, paidIsExclusive: false, paidTranscriptURL: nil, freeTranscriptURL: nil, paidEarlyAccessAudioURL: nil, paidIsExclusivePartially: false, paidExclusiveStartTime: 0, paidEarlyAccessDate: Date(), paidExclusivityType: nil, score: 4.0, audiobookID: nil, language: "en", episodeCount: 3, priority: 5, popularityScore: 70)
                ]),
                .init(name: "Editor's Pick", type: SectionDTOType.twoLinesGrid.rawValue, contentType: SectionDTOContentType.episode.rawValue, order: 6, content: [
                    .init(podcastPopularityScore: 95, podcastPriority: 6, episodeID: "11", name: "Editor's Choice 1", seasonNumber: 1, episodeType: "regular", podcastName: "Editor's Podcast", authorName: "Editor Author", description: "Editor Description", number: 1, duration: 1800, avatarURL: "https://example.com/editor1.jpg", separatedAudioURL: "", audioURL: "", releaseDate: "2024-01-01", podcastID: "editor1", chapters: [], paidIsEarlyAccess: false, paidIsNowEarlyAccess: false, paidIsExclusive: false, paidTranscriptURL: nil, freeTranscriptURL: nil, paidEarlyAccessAudioURL: nil, paidIsExclusivePartially: false, paidExclusiveStartTime: 0, paidEarlyAccessDate: Date(), paidExclusivityType: nil, score: 4.8, audiobookID: nil, language: "en", episodeCount: 8, priority: 6, popularityScore: 95)
                ]),
                .init(name: "Popular Audiobooks", type: SectionDTOType.square.rawValue, contentType: SectionDTOContentType.audioBook.rawValue, order: 7, content: [
                    .init(podcastPopularityScore: nil, podcastPriority: nil, episodeID: nil, name: "Popular Audiobook 1", seasonNumber: nil, episodeType: nil, podcastName: nil, authorName: "Popular Author", description: "Popular Description", number: nil, duration: 6000, avatarURL: "https://example.com/popular1.jpg", separatedAudioURL: nil, audioURL: nil, releaseDate: "2024-01-01", podcastID: nil, chapters: nil, paidIsEarlyAccess: nil, paidIsNowEarlyAccess: nil, paidIsExclusive: nil, paidTranscriptURL: nil, freeTranscriptURL: nil, paidEarlyAccessAudioURL: nil, paidIsExclusivePartially: nil, paidExclusiveStartTime: nil, paidEarlyAccessDate: nil, paidExclusivityType: nil, score: 4.6, audiobookID: "popular1", language: "en", episodeCount: nil, priority: 7, popularityScore: 88)
                ])
            ]
            return HomeModel(sections: sections, pagination: .init(nextPage: "", totalPages: 1))
        }
    }
}
