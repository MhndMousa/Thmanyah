//
//  SquareViewModelProtocol.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import Foundation

protocol SquareViewPreviewable: CarouselPreviewable {
    var text: String { get }
    var datePosted: Date { get }
    var length: Int { get }
    var imageUrlString: String { get }
}

protocol SquareViewModelProtocol: ObservableObject {
    var previewable: SquareViewPreviewable { get }
    var isPlaying: Bool { get }
    func onClick()
    func onPlayButtonClick()
}
