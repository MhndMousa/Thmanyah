//
//  SquareViewModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import Foundation

class BigSquareViewModel: BigSquareViewModelProtocol {
    var title: String
    var subtitle: String
    var imageUrlString: String
    
    init(title: String, subtitle: String, imageUrlString: String) {
        self.title = title
        self.subtitle = subtitle
        self.imageUrlString = imageUrlString
    }
    
    func onClick() {}
    
}
