//
//  URLOpener.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation
import UIKit

class URLOpener: URLOpenerProtocol {
    func open(_ url: URL?) {
        guard canOpen(url), let url else {return}
        UIApplication.shared.open(url)
    }
    
    func canOpen(_ url: URL?) -> Bool {
        guard let url else {return false}
        return UIApplication.shared.canOpenURL(url)
    }
}
