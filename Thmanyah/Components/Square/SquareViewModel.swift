//
//  SquareViewModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import Foundation

class SquareViewModel: SquareViewModelProtocol {
    var previewable:  SquareViewPreviewable
    
    @Published var isPlaying: Bool
    
    init(previewable: SquareViewPreviewable, isPlaying: Bool) {
        self.previewable = previewable
        self.isPlaying = isPlaying
    }
    
    func onClick() {
    }
    
    func onPlayButtonClick() {
        
    }
}
