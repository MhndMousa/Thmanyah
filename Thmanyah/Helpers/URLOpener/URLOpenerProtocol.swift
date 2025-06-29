//
//  URLOpenerProtocol.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation

protocol URLOpenerProtocol {
    func open(_ url: URL)
    func canOpen(_ url: URL) -> Bool
}
