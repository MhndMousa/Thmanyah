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
        OnlineImage(urlString: viewModel.imageUrlString)
            .frame(width: 75, height: 75)
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
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}


#Preview {
    
    class Fixture: TwoLineViewModelProtocol {
        
        var imageUrlString: String = "https://www.imgonline.com.ua/examples/random-pixels-big.png"
        var isPlaying: Bool = true
        var text = "النجاة من الموت: غرق عبارالنجاة من "
        var datePosted = Date(timeIntervalSince1970: Date().timeIntervalSince1970 - 60 * 14 * 3)
        var length = 98
        
        func onClick() {}
        func onOptionsButtonClick() { }
        func onAddToQueueButtonClick() { }
        func onPlayButtonClick() { }
    }
    
    return TwoLineView(viewModel: Fixture())
        .background(.black)
}
