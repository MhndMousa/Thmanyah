//
//  SquareViewModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import Foundation

class SquareViewModel: SquareViewModelProtocol {
    
    @Published var text: String
    @Published var datePosted: Date
    @Published var isLoading: Bool
    @Published var isPlaying: Bool
    var length: Int
    var imageUrlString: String
    
    init(text: String, datePosted: Date, isLoading: Bool, isPlaying: Bool, placeholderString: String = "placeholder", length: Int, imageUrlString: String) {
        self.text = text
        self.datePosted = datePosted
        self.isLoading = isLoading
        self.isPlaying = isPlaying
        self.length = length
        self.imageUrlString = imageUrlString
    }
    
    func onClick() {
    }
    
    func onPlayButtonClick() {
        
    }
}
