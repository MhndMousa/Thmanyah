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
        OnlineImage(urlString: viewModel.imageUrlString)
            .frame(width: 200, height: 200)
            .cornerRadius(20)
            .onTapGesture {
                viewModel.onClick()
            }
    }
    
    private var title: some View {
        Text(viewModel.text)
            .foregroundStyle(Color.textColor)
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
        Label(("\(viewModel.length / 60)س . \(viewModel.length % 60)د"), systemImage: !viewModel.isPlaying ? "play.fill" : "pause.fill")
            .foregroundStyle(Color.textColor)
            .font(.footnote)
            .bold()
    }
    private var datePosted: some View {
        Text("\( RelativeDateTimeFormatter().localizedString(for: viewModel.datePosted, relativeTo: .now))")
            .foregroundStyle(Color.textColor)
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
    }
}


#Preview {
    
    class Fixture: SquareViewModelProtocol {
        var placeholderString: String = "placeholder"
        var imageUrlString: String = "https://www.imgonline.com.ua/examples/random-pixels-big.png"
        var isLoading: Bool = true
        var isPlaying: Bool = true
        var text = "النجاة من الموت: غرق عبارالنجاة من "
        var datePosted = Date(timeIntervalSince1970: Date().timeIntervalSince1970 - 60 * 14 * 3)
        var length = 98
        func onClick() {
            isLoading.toggle()
        }
        func onPlayButtonClick() {
            isPlaying.toggle()
        }
    }
    
    return SquareView(viewModel: Fixture())
}
