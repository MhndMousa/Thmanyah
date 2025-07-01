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
        OnlineImage(urlString: viewModel.previewable.imageUrlString)
            .frame(width: 200, height: 200)
            .cornerRadius(20)
            .onTapGesture {
                viewModel.onClick()
            }
    }
    
    private var title: some View {
        Text(viewModel.previewable.text)
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
        Label(("\(viewModel.previewable.length / 60)س . \(viewModel.previewable.length % 60)د"), systemImage: !viewModel.isPlaying ? "play.fill" : "pause.fill")
            .foregroundStyle(Color.textColor)
            .font(.footnote.weight(.bold))
            .bold()
    }
    private var datePosted: some View {
        Text("\( RelativeDateTimeFormatter().localizedString(for: viewModel.previewable.datePosted, relativeTo: .now))")
            .foregroundStyle(Color.textColorWeak)
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
        var previewable: SquareViewPreviewable = Mock.SquareViewPreviewableMock()
        var isPlaying: Bool = false
        func onClick() { }
        func onPlayButtonClick() { }
    }
    
    return SquareView(viewModel: Fixture())
}
