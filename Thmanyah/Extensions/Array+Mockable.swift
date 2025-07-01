//
//  Mockable.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//


protocol Mockable {
    static func mock() -> Self
}

extension Array where Element: Mockable {
    static func generateMocks(_ count: Int) -> [Element] {
        (0..<count)
            .map { _ in Element.mock() }
    }
}
