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
        .onLoad {
            viewModel.onLoad()
        }
        .refreshable {
            viewModel.onLoad()
        }
        
    }
    
    private var headerView: some View {
        HStack{
            Text("Welcome, \(name)")
            Spacer()
            Image(systemName: "bell")
                .resizable()
                .scaledToFill()
                .frame(width: 26, height: 26, alignment: .center)
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
    private var topPodcasts: some View {
        LazyVStack(alignment: .leading) {
            Text(viewModel.topPodcasts.name)
                .font(.title2)
                .foregroundStyle(Color.textColor)
                
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
    }
    
    private var trendingPodcasts: some View {
        LazyVStack(alignment: .leading) {
            Text(viewModel.trendingPodcasts.name)
                .font(.title2)
                .foregroundStyle(Color.textColor)
            
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
    }
    
    private var bestSellingAudiobooks: some View {
        LazyVStack(alignment: .leading) {
            Text(viewModel.bestSellingAudiobooks.name)
                .font(.title2)
                .foregroundStyle(Color.textColor)
                
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
    }
    
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
    }
    
    return HomeView(
        viewModel: Fixture()
    )
}
