//
//  SquareViewModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import Foundation

class TwoLineViewModel: TwoLineViewModelProtocol {
    
    @Published var isPlaying: Bool
    let previewable: TwoLineViewPreviewable
    
    
    init(previewable: any TwoLineViewPreviewable, isPlaying: Bool) {
        self.previewable = previewable
        self.isPlaying = isPlaying
    }
    
    func onClick() {
        
    }
    
    func onPlayButtonClick() {
        
    }
    
    func onOptionsButtonClick() {
        
    }
    
    func onAddToQueueButtonClick() {
        
    }
    
}
