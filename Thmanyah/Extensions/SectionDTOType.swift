//
//  SectionDTOType.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import Foundation
extension SectionDTOType {
    var toCarouselViewType: CarouselViewType {
        switch self {
        case .bigSquare,.bigSquare2:    return .bigSquare
        case .square:                   return .square
        case .queue:                    return .queue
        case .twoLinesGrid:             return .twoLinesGrid
        }
    }
}
