//
//  CarouselView.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation
import SwiftUI

enum CarouselViewType: String, Codable {
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
                case .square:
                    squareCarouselContent
                case .twoLinesGrid:
                    Text("Two Lines Grid")
                case .bigSquare:
                    Text("Big Square")
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
                        .opacity(phase.isIdentity ? 1 : 0.2)
                        .scaleEffect(x: phase.isIdentity ? 1 : 0.75,
                                     y: phase.isIdentity ? 1 : 0.75)
                }
                .containerRelativeFrame(.horizontal, count: 2, spacing: -50)
        }
    }
    
//    private var twoLinesGridCarouselContent: some View {
//    }
//
//    private var bigSquareCarouselContent: some View {
//
//    }
//
//    private var queueCarouselContent: some View {
//
//    }
}

#Preview("square") {
    CarouselView(
        items: [PodcastDTO.mock(), PodcastDTO.mock(),PodcastDTO.mock(), PodcastDTO.mock(),PodcastDTO.mock(), PodcastDTO.mock(),PodcastDTO.mock(), PodcastDTO.mock(),PodcastDTO.mock(), PodcastDTO.mock(), PodcastDTO.mock()],
        contentType: .square,
        isAtTheEndOfCarousel: false,
    ){ item in
        SquareView(
            viewModel: SquareViewModel(text: item.name, datePosted: Date(), isLoading: false, isPlaying: false, length: item.duration)
        )
    }
}
#Preview("twoLinesGrid") {
    CarouselView(
        items: [PodcastDTO.mock(), PodcastDTO.mock(), PodcastDTO.mock()],
        contentType: .twoLinesGrid,
        isAtTheEndOfCarousel: false,
    ){ item in
        SquareView(
            viewModel: SquareViewModel(text: item.name, datePosted: Date(), isLoading: false, isPlaying: false, length: item.duration)
        )
    }
}
#Preview("Queue") {
    CarouselView(
        items: [PodcastDTO.mock(), PodcastDTO.mock(), PodcastDTO.mock()],
        contentType: .square,
        isAtTheEndOfCarousel: false,
    ){ item in
        SquareView(
            viewModel: SquareViewModel(text: item.name, datePosted: Date(), isLoading: false, isPlaying: false, length: item.duration)
        )
    }
}
#Preview("Big Saquare") {
    CarouselView(
        items: [PodcastDTO.mock(), PodcastDTO.mock(), PodcastDTO.mock()],
        contentType: .square,
        isAtTheEndOfCarousel: false,
    ){ item in
        SquareView(
            viewModel: SquareViewModel(text: item.name, datePosted: Date(), isLoading: false, isPlaying: false, length: item.duration)
        )
    }
}

