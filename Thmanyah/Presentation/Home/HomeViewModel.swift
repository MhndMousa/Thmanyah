//
//  HomeViewModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import UIKit

class HomeViewModel: HomeViewModelProtocol {

    @Published private(set) var isLoading = true
    
    @Published private(set) var topPodcasts: SectionDTO<PodcastDTO> = .placeholder(contentType: .podcast)
    @Published private(set) var trendingPodcasts: SectionDTO<EpisodeDTO> = .placeholder(contentType: .episode)
    @Published private(set) var bestSellingAudiobooks: SectionDTO<AudioBookDTO> = .placeholder(contentType: .audioBook)
    @Published private(set) var mustReadAudioArticles: SectionDTO<AudioArticleDTO> = .placeholder(contentType: .audioArticle)
    @Published private(set) var newPodcasts: SectionDTO<PodcastDTO> = .placeholder(contentType: .podcast)
    @Published private(set) var editorsPick: SectionDTO<EpisodeDTO> = .placeholder(contentType: .episode)
    @Published private(set) var popularAudiobooks: SectionDTO<AudioBookDTO> = .placeholder(contentType: .audioBook)

    
    private let urlOpener: URLOpenerProtocol
    private let homeService: HomeServiceProtocol
    private var content: HomeModel? { didSet { updateSection() } }
    private var currentPage: Int = 1

    
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
    
    func onProfileClick() {}
    
    func onBellButtonClick() {}
    
    func onClickForMoreButton(section: Int) {}
    
    private func updateSection() {
        guard var sections = content?.sections  else { return }
        
        sections.sort { $0.order < $1.order }
        
        topPodcasts = .init(section: sections.removeFirst())
        trendingPodcasts = .init(section: sections.removeFirst())
        bestSellingAudiobooks = .init(section: sections.removeFirst())
        mustReadAudioArticles = .init(section: sections.removeFirst())
        newPodcasts = .init(section: sections.removeFirst())
        editorsPick = .init(section: sections.removeFirst())
        popularAudiobooks = .init(section: sections.removeFirst())
    }
    
    func onSectionChange(_ string: String) {
        updateSectionsToShow()
    }
    
    func onReachingEndOfList() {
        Task {
            isLoading = true
            do {
                currentPage += 1
                let homeData = try await homeService.loadNextPageData(page: currentPage)
                
                let sections = homeData.sections.sorted(by: { $0.order < $1.order })
                
                isLoading = false
                updateSectionsToShow()
            } catch {
                currentPage -= 1
                Toast.error(subtitle: error.localizedDescription)
                isLoading = false
            }
        }
    }
    
    private func updateSectionsToShow() {
        // If nothing is selected show all
//        guard let selectedSection else {
//            sectionsToShow = sections
//            return
//        }
//        // show selected section only
//        sectionsToShow = sections.filter{$0.contentType == selectedSection}
    }
}
