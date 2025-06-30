//
//  HomeViewModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import UIKit

class HomeViewModel: HomeViewModelProtocol {

    @Published private(set) var isLoading = true
    
    @Published private(set) var topPodcasts: [PodcastDTO] = []
    @Published private(set) var trendingPodcasts: [EpisodeDTO] = []
    @Published private(set) var bestSellingAudiobooks: [AudioBookDTO] = []
    @Published private(set) var mustReadAudioArticles: [AudioArticleDTO] = []
    @Published private(set) var newPodcasts: [PodcastDTO] = []
    @Published private(set) var editorsPick: [EpisodeDTO] = []
    @Published private(set) var popularAudiobooks: [AudioBookDTO] = []

    
    private let urlOpener: URLOpenerProtocol
    private let homeService: HomeServiceProtocol
    private var content: HomeModel? { didSet { updateSection() } }
    
    init(urlOpener: URLOpenerProtocol, homeService: HomeServiceProtocol) {
        self.urlOpener = urlOpener
        self.homeService = homeService
    }
    
    func onChangeLanguage() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return } // TODO: Show error on fail?
        
        urlOpener.open(url)
    }
    
    func onLoad() {
        Task {
            isLoading = true
            do {
                let homeData = try await homeService.fetchHomeData()
                content = homeData
                isLoading = false
            } catch {
                isLoading = false // TODO: Handle error
            }
        }
    }
    func appendStuff() {
        topPodcasts.append(.init(podcastID: "213213", name: "", description: "12312", avatarURL: "123", episodeCount: 213, duration: 12, language: "12312", priority: 123, popularityScore: 2131, score: 14))
        print(topPodcasts.count)
    }
    
    private func updateSection() {
        topPodcasts.append(contentsOf:  content?.sections.first(where: {$0.name == "Top Podcasts"})?.content.map({PodcastDTO.map(from: $0)}) as? [PodcastDTO] ?? [])
        trendingPodcasts.append(contentsOf:  content?.sections.first(where: {$0.name == "Trending Podcasts"})?.content as? [EpisodeDTO] ?? [])
        bestSellingAudiobooks.append(contentsOf:  content?.sections.first(where: {$0.name == "Bestselling Audiobooks"})?.content as? [AudioBookDTO] ?? [])
        mustReadAudioArticles.append(contentsOf:  content?.sections.first(where: {$0.name == "Must-Read Audio Articles"})?.content as? [AudioArticleDTO] ?? [])
        newPodcasts.append(contentsOf:  content?.sections.first(where: {$0.name == "New Podcasts"})?.content as? [PodcastDTO] ?? [])
        editorsPick.append(contentsOf:  content?.sections.first(where: {$0.name == "Editor's Pick Episodes"})?.content as? [EpisodeDTO] ?? [])
        popularAudiobooks.append(contentsOf:  content?.sections.first(where: {$0.name == "Popular in Audiobooks"})?.content as? [AudioBookDTO] ?? [])
    }
}
