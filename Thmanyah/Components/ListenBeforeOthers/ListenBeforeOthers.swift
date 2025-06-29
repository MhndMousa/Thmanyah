//
//  ListenBeforeOthers.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import SwiftUI

struct ListenBeforeOthers<ViewModel> : View where ViewModel: ListenBeforeOthersViewModelProtocol {
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        content
    }
    
    private var coverImage : some View {
        Image("placeholder")
            .resizable()
            .frame(width: 200, height: 200)
            .onTapGesture {
                viewModel.onClick()
            }
        
    }
    private var title: some View {
        Text(viewModel.text)
            .multilineTextAlignment(.leading)
    }
    private var playButton: some View {
        Button("\(viewModel.length)"){
            viewModel.onPlayButtonClick()
        }
        .background(
            Capsule().fill(Color.blue)
        )
    }
    
    private var datePosted: some View {
        Text("\( RelativeDateTimeFormatter().localizedString(for: Date(), relativeTo: viewModel.datePosted))")
    }
    
    private var content: some View {
        VStack(alignment: .leading) {
            coverImage
            title
            HStack {
                playButton
                datePosted
            }
        }
//        .shimmer(viewModel.isLoading) // TODO: Fix shimmering
    }
}

protocol ListenBeforeOthersViewModelProtocol: ObservableObject {
    var text: String { get set }
    var datePosted: Date { get }
    var length: Int { get }
    var imageUrl: URL? { get }
    var isLoading: Bool { get }
    func onClick()
    func onPlayButtonClick()
}

class ListenBeforeOthersViewModel: ListenBeforeOthersViewModelProtocol {
    @Published var text: String
    @Published var datePosted: Date
    @Published var isLoading: Bool
    var length: Int
    var imageUrl: URL?
    
    init(text: String, datePosted: Date, isLoading: Bool, length: Int, imageUrl: URL? = nil) {
        self.text = text
        self.datePosted = datePosted
        self.isLoading = isLoading
        self.length = length
        self.imageUrl = imageUrl
    }
    
    func onClick() {
    }
    
    func onPlayButtonClick() {
        
    }
}


#Preview {
    
    class Fixture: ListenBeforeOthersViewModelProtocol {
        var imageUrl: URL? = nil
        var isLoading: Bool = true
        var text = "النجاة من الموت: غرق عبار"
        var datePosted = Date(timeIntervalSince1970: Date().timeIntervalSince1970 + 100000)
        var length = 3600
        func onClick() {
            isLoading.toggle()
        }
        func onPlayButtonClick() {}
    }
    
    return ListenBeforeOthers(viewModel: Fixture())
}
