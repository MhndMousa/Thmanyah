//
//  HomeViewModelProtocol.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Combine

@MainActor
protocol HomeViewModelProtocol: ObservableObject {
    var topPodcasts: SectionDTO<PodcastDTO> { get }
    var trendingPodcasts: SectionDTO<EpisodeDTO> { get }
    var bestSellingAudiobooks: SectionDTO<AudioBookDTO> { get }
    var mustReadAudioArticles: SectionDTO<AudioArticleDTO> { get }
    var newPodcasts: SectionDTO<PodcastDTO> { get }
    var editorsPick: SectionDTO<EpisodeDTO> { get }
    var popularAudiobooks: SectionDTO<AudioBookDTO> { get }
    
    var isLoading: Bool { get }
    var audioPlayer: AudioPlayerProtocol { get }
    
    func onChangeLanguage()
    func onLoad()async
    func onBellButtonClick()
    func onProfileClick()
    func onClickForMoreButton(section: Int)
    func onSectionChange(_ string: String)
    func onReachingEndOfList()async
    
}
