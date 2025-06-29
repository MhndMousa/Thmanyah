//
//  OnLoadViewModifer.swift
//  Remu
//
//  Created by Muhannad Alnemer on 6/16/25.
//

import SwiftUI

public struct OnLoadViewModifier: ViewModifier {
    @State private var didAppear = false
    var action: Closure?
    
    public func body(content: Content) -> some View {
        content.onAppear {
            guard !didAppear else {return}
            didAppear = true
            action?()
        }
    }
}

public extension View {
    func onLoad(_ action: @escaping Closure) -> some View {
        modifier(OnLoadViewModifier(action: action))
    }
}
