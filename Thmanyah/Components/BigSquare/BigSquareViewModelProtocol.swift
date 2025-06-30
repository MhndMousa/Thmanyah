//
//  BigSquareViewModelProtocol.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import Foundation

protocol BigSquareViewModelProtocol: ObservableObject {
    var title: String { get set }
    var subtitle: String { get set }
    var imageUrlString: String { get }
    func onClick()
}
