//
//  TwoLineView.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//



import SwiftUI

struct TwoLineView<ViewModel> : View where ViewModel: TwoLineViewModelProtocol {
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        content
    }
    
    private var coverImage : some View {
        OnlineImage(urlString: viewModel.previewable.imageUrlString)
            .frame(width: 75, height: 75)
            .cornerRadius(20)
            .onTapGesture {
                viewModel.onClick()
            }
    }
    
    private var title: some View {
        Text(viewModel.previewable.text)
            .foregroundStyle(Color.textColor)
            .multilineTextAlignment(.leading)
            .font(.headline.weight(.bold))
        
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
    }
    private var datePosted: some View {
        Text("\( RelativeDateTimeFormatter().localizedString(for: viewModel.previewable.datePosted, relativeTo: .now))")
            .foregroundStyle(Color.textColorWeak)
            .font(.footnote)
    }
    private var optionsButton: some View {
        Button(
            action: {
                viewModel.onOptionsButtonClick()
            }, label: {
                Image(systemName: "ellipsis")
                    .foregroundStyle(Color.textColor)
            }
        )
    }
    
    private var addToQueueButton: some View {
        Button(
            action: {
                viewModel.onAddToQueueButtonClick()
            }, label: {
                Image(systemName: "text.badge.plus")
                    .foregroundStyle(Color.textColor)
            }
        )
    }
    
    private var content: some View {
        HStack() {
            coverImage
            VStack(alignment: .leading, spacing: 8) {
                datePosted
                title
                HStack{
                    playButton
                    Spacer()
                    optionsButton
                    addToQueueButton
                }
            }
        }
        .frame(maxWidth: 300)
        .padding(.vertical, 5)
    }
}


#Preview {
    
    class Fixture: TwoLineViewModelProtocol {
        var previewable: TwoLineViewPreviewable = Mock.TwoLinePreviewableMock()
        
        var isPlaying: Bool = false
        func onClick() {}
        func onOptionsButtonClick() { }
        func onAddToQueueButtonClick() { }
        func onPlayButtonClick() { }
    }
    
    return TwoLineView(viewModel: Fixture())
        .background(.black)
}
