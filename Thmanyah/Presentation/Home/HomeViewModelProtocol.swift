//
//  HomeViewModelProtocol.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Combine

@MainActor
protocol HomeViewModelProtocol: ObservableObject {
    var topPodcasts: [PodcastDTO] { get }
    var trendingPodcasts: [EpisodeDTO] { get }
    var bestSellingAudiobooks: [AudioBookDTO] { get }
    var mustReadAudioArticles: [AudioArticleDTO] { get }
    var newPodcasts: [PodcastDTO] { get }
    var editorsPick: [EpisodeDTO] { get }
    var popularAudiobooks: [AudioBookDTO] { get }
    
    var isLoading: Bool { get }
    func appendStuff()
    func onChangeLanguage()
    func onLoad()
}
