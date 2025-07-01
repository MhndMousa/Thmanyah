//
//  Mock.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/1/25.
//

import Foundation

struct Mock {
    private init() {}
    static let imageUrl = "https://www.imgonline.com.ua/examples/random-pixels-big.png"
}

extension Mock {
    struct TwoLinePreviewableMock: TwoLineViewPreviewable {
        var text: String = .random()
        var datePosted: Date = Date()
        var length: Int = .random()
        var imageUrlString: String = Mock.imageUrl
    }
    
    struct SquareViewPreviewableMock: SquareViewPreviewable {
        var text: String = .random()
        var datePosted: Date = Date()
        var length: Int = .random()
        var imageUrlString: String = Mock.imageUrl
        
    }
    struct BigSquarePreviewableMock: BigSquareViewPreviewable {
        var title: String = .random()
        var subtitle: String = .random()
        var imageUrlString: String = Mock.imageUrl
        
        
    }
}
