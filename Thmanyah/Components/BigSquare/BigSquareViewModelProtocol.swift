//
//  BigSquareViewModelProtocol.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import Foundation

protocol BigSquareViewPreviewable: CarouselPreviewable {
    var title: String { get }
    var subtitle: String { get }
    var imageUrlString: String { get }
}
protocol BigSquareViewModelProtocol: ObservableObject {
    var previewable: BigSquareViewPreviewable { get set }
    func onClick()
}
