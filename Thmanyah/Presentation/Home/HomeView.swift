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
            viewModel.onLoad()
        }
        .refreshable {
            viewModel.onLoad()
        }
        
    }
    private var list: some View {
        LazyVStack {
            theQueue
            topPodcasts
            trendingPodcasts
            bestSellingAudiobooks
        }
        .shimmer(viewModel.isLoading)
    }
    
    private var theQueue: some View {
        HStack{
            
        }
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
    
    private var navigationBarTitle: some View {
        VStack{
            
            Spacer()
            Text("Hello \(name)")
            Spacer()
            Button("Change the language") {
                viewModel.onChangeLanguage()
            }
            AsyncButton("Call Service") {
                viewModel.onLoad()
            }
        }
        .padding()
    }
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
                    .foregroundStyle(Color.textColor)
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
                Image(systemName: "chevron.left")
                    .foregroundStyle(Color.textColor)
            }
        )
    }
    
    private var topPodcasts: some View {
        section(
            header: {
                Text(viewModel.topPodcasts.name)
            }, content: {
                CarouselView(items: viewModel.topPodcasts.items, contentType: viewModel.topPodcasts.type.toCarouselViewType) { item in
                    SquareView(
                        viewModel: SquareViewModel(
                            text: item.name,
                            datePosted: Date(), // TODO: ??
                            isPlaying: false,
                            length: item.duration,
                            imageUrlString: item.avatarURL
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
            }, content: {
                CarouselView(items:viewModel.trendingPodcasts.items, contentType: viewModel.trendingPodcasts.type.toCarouselViewType){ item in
                    TwoLineView(
                        viewModel: TwoLineViewModel(
                            text: item.name,
                            datePosted: Date(), // TODO: ??
                            isPlaying: false, // TODO: check Audio manager?
                            length: item.duration,
                            imageUrlString: item.avatarURL
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
            }, content: {
                CarouselView(items: viewModel.bestSellingAudiobooks.items, contentType: viewModel.bestSellingAudiobooks.type.toCarouselViewType) { item in
                    BigSquareView(
                        viewModel: BigSquareViewModel(
                            title: item.name,
                            subtitle: item.authorName,
                            imageUrlString: item.avatarURL
                        )
                    )
                }
            }
        )
    }
}

#Preview {
    class Fixture: HomeViewModelProtocol {
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
    }
    
    return HomeView(
        viewModel: Fixture()
    )
}
