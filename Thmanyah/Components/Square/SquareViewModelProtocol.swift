//
//  SquareViewModelProtocol.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import Foundation

protocol SquareViewModelProtocol: ObservableObject {
    var text: String { get set }
    var datePosted: Date { get }
    var length: Int { get }
    var imageUrl: URL? { get }
    var isLoading: Bool { get }
    var isPlaying: Bool { get }
    func onClick()
    func onPlayButtonClick()
}
