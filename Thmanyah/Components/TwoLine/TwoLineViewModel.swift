//
//  SquareViewModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import Foundation

class TwoLineViewModel: TwoLineViewModelProtocol {
    
    @Published var text: String
    @Published var datePosted: Date
    @Published var isPlaying: Bool
    var length: Int
    var imageUrlString: String
    
    init(text: String, datePosted: Date, isPlaying: Bool, placeholderString: String = "placeholder", length: Int, imageUrlString: String) {
        self.text = text
        self.datePosted = datePosted
        self.isPlaying = isPlaying
        self.length = length
        self.imageUrlString = imageUrlString
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
