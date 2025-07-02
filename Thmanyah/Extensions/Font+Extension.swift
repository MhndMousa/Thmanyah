//
//  Font+Extension.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import SwiftUI

extension Font {
    static var fontName: String = ""
    
    static func setup(fontName: String) {
        self.fontName = fontName
    }
    
    static let title: Font = .custom(fontName, size: 42)
    static let body: Font = .custom(fontName, size: 24)
    static let heading: Font = .custom(fontName, size: 18)
    static let subtitles: Font = .custom(fontName, size: 15)
    static let sectionHeader: Font = .custom(fontName, size: 22)
}
