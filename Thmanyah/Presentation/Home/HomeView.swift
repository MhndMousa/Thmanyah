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
        VStack{
            headerView
            list
        }
        .padding()
        .onLoad {
            viewModel.onLoad()
        }
        
    }
    
    private var headerView: some View {
        HStack{
            Text("Welcome, \(name)")
            Spacer()
            Button("Append") {
                viewModel.appendStuff()
            }
            Image(systemName: "bell")
                .resizable()
                .scaledToFill()
                .frame(width: 26, height: 26, alignment: .center)
        }
    }
    
    
    private var list: some View {
        ScrollView(.vertical) {
            theQueue
            topPodcasts
                .frame(height: 300)
        }
        .background(
            Color.backgroundColor
        )
    }
    
    private var theQueue: some View {
        HStack{
            
        }
    }
    private var topPodcasts: some View {
        CarouselView(items: viewModel.topPodcasts, contentType: .square) { item in
            SquareView(
                viewModel: SquareViewModel(
                    text: item.name,
                    datePosted: Date(), // TODO: ??
                    isLoading: viewModel.isLoading,
                    isPlaying: false,
                    length: item.duration
                )
            )
            .background(.red)
        }
    }
    private var newEpisodes: some View {
        EmptyView()
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
        func appendStuff() {
            
        }
        
        var topPodcasts: [PodcastDTO] = []
        var trendingPodcasts: [EpisodeDTO] = []
        var bestSellingAudiobooks: [AudioBookDTO] = []
        var mustReadAudioArticles: [AudioArticleDTO] = []
        var newPodcasts: [PodcastDTO] = []
        var editorsPick: [EpisodeDTO] = []
        var popularAudiobooks: [AudioBookDTO] = []
        var content: HomeModel? = nil
        var isLoading: Bool = false
        func onChangeLanguage() {}
        func onLoad() {}
    }
    
    return HomeView(
        viewModel: Fixture()
    )
}
