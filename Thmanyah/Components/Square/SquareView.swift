//
//  Square.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//



import SwiftUI

struct SquareView<ViewModel> : View where ViewModel: SquareViewModelProtocol {
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


#Preview {
    
    class Fixture: SquareViewModelProtocol {
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
    
    return SquareView(viewModel: Fixture())
}
