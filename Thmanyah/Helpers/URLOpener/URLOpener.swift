//
//  URLOpener.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation
import UIKit

class URLOpener: URLOpenerProtocol {
    func open(_ url: URL) {
        UIApplication.shared.open(url)
    }
    
    func canOpen(_ url: URL) -> Bool {
        UIApplication.shared.canOpenURL(url)
    }
}
