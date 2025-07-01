//
//  SquareViewModelProtocol.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import Foundation

protocol TwoLineViewPreviewable: CarouselPreviewable {
    var text: String { get }
    var datePosted: Date { get }
    var length: Int { get }
    var imageUrlString: String { get }
}

protocol TwoLineViewModelProtocol: ObservableObject {
    var previewable: TwoLineViewPreviewable { get }
    var isPlaying: Bool { get }
    
    func onClick()
    func onPlayButtonClick()
    func onOptionsButtonClick()
    func onAddToQueueButtonClick()
}
