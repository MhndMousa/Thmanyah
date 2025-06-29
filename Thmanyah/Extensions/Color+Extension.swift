//
//  Color+Extension.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import SwiftUI


extension Color {
    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1){
        self.init(uiColor: .init(red: red, green: green, blue: blue, alpha: alpha))
    }
}

extension Color {
    
    // TODO: Add support for dark and light mode
    static let backgroundColor: Color = .init(red: 0, green: 0, blue: 0)
    static let textColor: Color = .init(red: 255, green: 255, blue: 255)
    static let textColorWeak: Color = .init(red: 208, green: 208, blue: 208)
}
