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
            .frame(width: 200)
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
            .font(.heading)
        
    }
    private var playButton: some View {
        Button( action:{
            viewModel.onPlayButtonClick()
        }, label: {
            duration
        })
        .padding(.horizontal,8)
        .padding(.vertical, 5)
        .background(
            Capsule().fill(Color.backgroundColorWeak)
        )
    }
    
    private var duration: some View {
        Label(("\(viewModel.length)"), systemImage: viewModel.isPlaying ? "play.fill" : "pause.fill")
            .foregroundStyle(Color.textColor)
            .font(.footnote)
            .bold()
    }
    private var datePosted: some View {
        Text("\( RelativeDateTimeFormatter().localizedString(for: Date(), relativeTo: viewModel.datePosted))")
            .font(.footnote)
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
        .shimmer(viewModel.isLoading) // TODO: Fix shimmering
    }
}


#Preview {
    
    class Fixture: SquareViewModelProtocol {
        var imageUrl: URL? = nil
        var isLoading: Bool = true
        var isPlaying: Bool = true
        var text = "النجاة من الموت: غرق عبارالنجاة من "
        var datePosted = Date(timeIntervalSince1970: Date().timeIntervalSince1970 + 100000)
        var length = 3600
        func onClick() {
            isLoading.toggle()
        }
        func onPlayButtonClick() {
            isPlaying.toggle()
        }
    }
    
    return SquareView(viewModel: Fixture())
}
