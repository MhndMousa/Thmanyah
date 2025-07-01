//
//  Mapper.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/1/25.
//

import Foundation

protocol Mapper {
    associatedtype From
    associatedtype To
    
    static func map(_ from: From) -> To
    
}
