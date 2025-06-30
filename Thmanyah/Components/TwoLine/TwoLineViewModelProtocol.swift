//
//  SquareViewModelProtocol.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import Foundation

protocol TwoLineViewModelProtocol: ObservableObject {
    var text: String { get set }
    var datePosted: Date { get }
    var length: Int { get }
    var imageUrlString: String { get }
    var isPlaying: Bool { get }
    
    func onClick()
    func onPlayButtonClick()
    func onOptionsButtonClick()
    func onAddToQueueButtonClick()
}
