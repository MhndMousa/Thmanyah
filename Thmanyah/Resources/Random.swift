//
//  Random.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/1/25.
//

struct Random {
    static func int(_ from: Int = 0 , _ to: Int = 10000) -> Int {
        let range: ClosedRange<Int> = .init(uncheckedBounds: (from,to))
        return Int.random(in: range)
    }
    
    static func string(length: Int = 10) -> String {
        let letters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ")
        return String((0..<length).self.map { _ in letters.randomElement()! })
    }
    
    static func bool() -> Bool {
        .random()
    }
    
    static func double(_ from: Double = 0 , _ to: Double = 10000) -> Double {
        let range: ClosedRange<Double> = .init(uncheckedBounds: (from,to))
        return .random(in: range)
    }
}

extension String {
    static func random(_ length: Int = 10) -> Self{
        Random.string(length: length)
    }
}

extension Int {
    static func random(_ from: Int = 0 , _ to: Int = 10000) -> Self{
        Random.int(from,to)
    }
}

extension Double {
    static func random(_ from: Double = 0 , _ to: Double = 10000) -> Self{
        Random.double(from,to)
    }
}
