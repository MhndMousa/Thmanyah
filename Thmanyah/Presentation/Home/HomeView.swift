//
//  ContentView.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import SwiftUI

struct HomeView<ViewModel>: View where ViewModel: HomeViewModelProtocol {
    private let viewModel: ViewModel
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
            Image(systemName: "bell")
                .resizable()
                .scaledToFill()
                .frame(width: 26, height: 26, alignment: .center)
        }
    }
    
    
    private var list: some View {
        List {
            theQueue
            listenBeforeOthers
        }
        .background(
            Color.backgroundColor
        )
    }
    
    private var theQueue: some View {
        HStack{
            
        }
    }
    private var listenBeforeOthers: some View {
        HStack {
            CarouselView {
                ListenBeforeOthers(
                    viewModel: ListenBeforeOthersViewModel(
                        text: "1",
                        datePosted: Date(timeIntervalSince1970: Date().timeIntervalSince1970 + 500000),
                        isLoading: false,
                        length: 3000,
                        imageUrl: URL(string: "https://yt3.ggpht.com/yti/ANjgQV_L0sDrKdyjbIA16mdDc4FW-vlnOSyB9Is0BmYsD7M=s108-c-k-c0x00ffffff-no-rj")
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
        func onChangeLanguage() {}
        func onLoad() {}
    }
    
    return HomeView(
        viewModel: Fixture()
    )
}
