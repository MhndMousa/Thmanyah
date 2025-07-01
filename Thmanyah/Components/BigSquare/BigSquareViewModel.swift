//
//  SquareViewModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import Foundation

class BigSquareViewModel: BigSquareViewModelProtocol {
    var previewable: BigSquareViewPreviewable
    
    init(previewable: BigSquareViewPreviewable) {
        self.previewable = previewable
    }
    
    func onClick() {}
    
}
