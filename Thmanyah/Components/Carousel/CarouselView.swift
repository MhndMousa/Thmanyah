//
//  CarouselView.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation
import SwiftUI

enum CarouselViewType: String, Codable {
    case pill
    case square = "square"
    case twoLinesGrid = "2_lines_grid"
    case bigSquare = "big_square"
    case queue = "queue"
}


struct CarouselView<ItemContent, Content: View>: View where ItemContent: Identifiable{
    private let contentType: CarouselViewType
    private var items: [ItemContent]
    var isAtTheEndOfCarousel: Bool = false
    var content: TypeReturnClosure<Content, ItemContent>
    
    init(
        items: [ItemContent],
        contentType: CarouselViewType,
        isAtTheEndOfCarousel: Bool = false,
        @ViewBuilder content: @escaping TypeReturnClosure<Content, ItemContent>
    ) {
        self.items = items
        self.contentType = contentType
        self.isAtTheEndOfCarousel = isAtTheEndOfCarousel
        self.content = content
    }
    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                switch contentType {
                case .pill:
                    Text("Pill")
                case .square:
                    squareCarouselContent
                case .twoLinesGrid:
                    twoLinesGridCarouselContent
                case .bigSquare:
                    bigSquareCarouselContent
                case .queue:
                    Text("Queue")
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(16, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden, axes: .horizontal)
    }
    
    private var squareCarouselContent: some View {
        ForEach(items) { item in
            content(item)
                .scrollTransition { content, phase in
                    content
                        .opacity(phase.isIdentity ? 1 : 0)
                        .scaleEffect(x: phase.isIdentity ? 1 : 0.75,
                                     y: phase.isIdentity ? 1 : 0.75)
                }
                .containerRelativeFrame(.horizontal, count: 2, spacing: -50)
        }
    }
    
    private var twoLinesGridCarouselContent: some View {
        LazyHGrid(rows: [
            GridItem(.flexible(minimum: 0, maximum: 75)),
            GridItem(.flexible(minimum: 0, maximum: 75))
        ]) {
            ForEach(items) { item in
                content(item)
            }
        }
    }

    private var bigSquareCarouselContent: some View {
        ForEach(items) { item in
            content(item)
        }
        .scrollTransition { content, phase in
            content
                .opacity(phase.isIdentity ? 1 : 0.5)
        }
    }
//
//    private var queueCarouselContent: some View {
//
//    }
}

#Preview("square") {
    CarouselView(
        items: Array<PodcastDTO>.generateMocks(4),
        contentType: .square,
        isAtTheEndOfCarousel: false,
    ){ item in
        SquareView(
            viewModel: SquareViewModel(text: item.name, datePosted: Date(), isPlaying: false, length: item.duration, imageUrlString: item.avatarURL)
        )
    }
}
#Preview("twoLinesGrid") {
    CarouselView(
        items: Array<PodcastDTO>.generateMocks(4),
        contentType: .twoLinesGrid,
        isAtTheEndOfCarousel: false,
    ){ item in
        TwoLineView(
            viewModel: TwoLineViewModel(text: item.name, datePosted: Date(), isPlaying: false, length: item.duration, imageUrlString: item.avatarURL)
        )
    }
    .background(.black)
}
#Preview("Queue") {
    CarouselView(
        items: Array<PodcastDTO>.generateMocks(4),
        contentType: .queue,
        isAtTheEndOfCarousel: false,
    ){ item in
        SquareView(
            viewModel: SquareViewModel(text: item.name, datePosted: Date(), isPlaying: false, length: item.duration, imageUrlString: item.avatarURL)
        )
    }
}
#Preview("Big Saquare") {
    CarouselView(
        items: Array<PodcastDTO>.generateMocks(4),
        contentType: .bigSquare,
        isAtTheEndOfCarousel: false,
    ){ item in
        BigSquareView(
            viewModel: BigSquareViewModel(title: item.name, subtitle: item.description , imageUrlString: item.avatarURL)
        )
    }
}

