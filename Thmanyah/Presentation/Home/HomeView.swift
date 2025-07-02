//
//  ContentView.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import SwiftUI

struct HomeView<ViewModel>: View where ViewModel: HomeViewModelProtocol {
    @ObservedObject private var viewModel: ViewModel
    let name = "Muhannad" // TODO: Remove this eventually, this is only here for localization testing
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.vertical){
            headerView
//            sections
            list
        }
        .padding()
        .background(
            Color.backgroundColor
        )
        .scrollIndicators(.never)
        .onLoad {
            Task {
                await viewModel.onLoad()
            }
        }
        .refreshable {
            Task {
                await viewModel.onLoad()
            }
        }
        
    }
    private var list: some View {
        LazyVStack {
            theQueue
            topPodcasts
            trendingPodcasts
            bestSellingAudiobooks
            mustReadAudioArticles
            newPodcasts
            editorsPick
            popularAudiobooks
        }
        .shimmer(viewModel.isLoading)
    }
    
    private var theQueue: some View {
        section(
            header: {
                HStack{
                    Text("The Queue")
                    Spacer()
                    //                    viewModel.audioPlayer
                }
            },
            content: {
                QueueView()
            }
        )
    }
    
    
    //    private var section: some View {
    //        CarouselView(items: ["1","2","3","4","5"], contentType: .pill) { item in
    //            Text(item)
    //                .background(
    //                    Capsule()
    //                        .foregroundStyle(Color.backgroundColorWeak)
    //                )
    //        }
    //    }
    
}

// MARK: - Header
extension HomeView {
    
    private var profileButton: some View {
        
        Button(
            action: {
                viewModel.onProfileClick()
            }, label: {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 22, height: 22, alignment: .center)
                    .scaledToFit()
                    .foregroundStyle(Color.textColor)
            }
        )
    }
    private var headerView: some View {
        HStack{
            profileButton
            Text("Welcome, \(name)")
            Spacer()
            notificationButton
        }
    }
    
    private var notificationButton: some View {
        Button(
            action: {
                viewModel.onBellButtonClick()
            }, label: {
                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width: 22, height: 22, alignment: .center)
                    .scaledToFit()
                    .foregroundStyle(Color.textColor)
            }
        )
    }
}

// MARK: - Sections

extension HomeView {
    
    @ViewBuilder
    private func section(header:TypeClosure<some View>, content: TypeClosure<some View> ) -> some View{
        LazyVStack(alignment: .leading) {
            HStack {
                header()
                    .font(.sectionHeader)
                Spacer()
                clickForMoreButton(0) // TODO: Get order of
            }
            content()
        }
        
    }
    private func clickForMoreButton(_ section: Int) -> some View {
        Button(
            action: {
                viewModel.onClickForMoreButton(section: section)
            }, label: {
                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.textColor)
            }
        )
    }
    
    private var topPodcasts: some View {
        section(
            header: {
                Text(viewModel.topPodcasts.name)
                    .foregroundStyle(Color.textColor)
            },
            content: {
                CarouselView(items: viewModel.topPodcasts.items, contentType: viewModel.topPodcasts.type.toCarouselViewType) { item in
                    SquareView(
                        viewModel: SquareViewModel(
                            previewable: item,
                            isPlaying: false
                        )
                    )
                }
            }
        )
    }
    
    private var trendingPodcasts: some View {
        section(
            header:{
                Text(viewModel.trendingPodcasts.name)
                    .foregroundStyle(Color.textColor)
            },
            content: {
                CarouselView(items:viewModel.trendingPodcasts.items, contentType: viewModel.trendingPodcasts.type.toCarouselViewType){ item in
                    TwoLineView(
                        viewModel: TwoLineViewModel(
                            previewable: item,
                            isPlaying: false
                        )
                    )
                }
            }
        )
    }
    
    private var bestSellingAudiobooks: some View {
        section(
            header:{
                Text(viewModel.bestSellingAudiobooks.name)
                    .foregroundStyle(Color.textColor)
            },
            content: {
                CarouselView(items: viewModel.bestSellingAudiobooks.items, contentType: viewModel.bestSellingAudiobooks.type.toCarouselViewType) { item in
                    BigSquareView(
                        viewModel: BigSquareViewModel(
                            previewable: item,
                        )
                    )
                }
            }
        )
    }
    
    private var mustReadAudioArticles: some View {
        section(
            header:{
                Text(viewModel.mustReadAudioArticles.name)
                    .foregroundStyle(Color.textColor)
            },
            content: {
                CarouselView(items: viewModel.bestSellingAudiobooks.items, contentType: viewModel.bestSellingAudiobooks.type.toCarouselViewType) { item in
                    BigSquareView(
                        viewModel: BigSquareViewModel(
                            previewable: item,
                        )
                    )
                }
            }
        )
    }
    private var newPodcasts: some View {
        section(
            header:{
                Text(viewModel.newPodcasts.name)
                    .foregroundStyle(Color.textColor)
            },
            content: {
                CarouselView(items: viewModel.newPodcasts.items, contentType: viewModel.newPodcasts.type.toCarouselViewType) { item in
                    BigSquareView(
                        viewModel: BigSquareViewModel(
                            previewable: item,
                        )
                    )
                }
            }
        )
    }
    private var editorsPick: some View {
        section(
            header:{
                Text(viewModel.editorsPick.name)
                    .foregroundStyle(Color.textColor)
            },
            content: {
                CarouselView(items: viewModel.editorsPick.items, contentType: viewModel.editorsPick.type.toCarouselViewType) { item in
                    BigSquareView(
                        viewModel: BigSquareViewModel(
                            previewable: item,
                        )
                    )
                }
            }
        )
    }
    private var popularAudiobooks: some View {
        section(
            header:{
                Text(viewModel.popularAudiobooks.name)
                    .foregroundStyle(Color.textColor)
            },
            content: {
                CarouselView(items: viewModel.popularAudiobooks.items, contentType: viewModel.popularAudiobooks.type.toCarouselViewType) { item in
                    TwoLineView(
                        viewModel: TwoLineViewModel(
                            previewable: item,
                            isPlaying: false
                        )
                    )
                }
            }
        )
    }
    
    
}

#Preview {
    class Fixture: HomeViewModelProtocol {
        var audioPlayer: AudioPlayerProtocol = AudioPlayer(queue: [])
        
        var topPodcasts: SectionDTO<PodcastDTO> = .placeholder(contentType: .podcast)
        var trendingPodcasts: SectionDTO<EpisodeDTO> = .placeholder(contentType: .episode)
        var bestSellingAudiobooks: SectionDTO<AudioBookDTO> = .placeholder(contentType: .audioBook)
        var mustReadAudioArticles: SectionDTO<AudioArticleDTO> = .placeholder(contentType: .audioArticle)
        var newPodcasts: SectionDTO<PodcastDTO> = .placeholder(contentType: .podcast)
        var editorsPick: SectionDTO<EpisodeDTO> = .placeholder(contentType: .episode)
        var popularAudiobooks: SectionDTO<AudioBookDTO> = .placeholder(contentType: .audioBook)
        
        var content: HomeModel? = nil
        var isLoading: Bool = false
        func onChangeLanguage() {}
        func onLoad() {}
        func onBellButtonClick() {}
        func onProfileClick() {}
        func onClickForMoreButton(section: Int) {}
        func onSectionChange(_ string: String) {}
        func onReachingEndOfList() {}
    }
    
    return HomeView(
        viewModel: Fixture()
    )
}
