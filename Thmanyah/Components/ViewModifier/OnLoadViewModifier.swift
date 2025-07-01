//
//  OnLoadViewModifer.swift
//  Remu
//
//  Created by Muhannad Alnemer on 6/16/25.
//

import SwiftUI

struct OnLoadViewModifier: ViewModifier {
    @State private var didAppear = false
    var action: Closure?
    
    func body(content: Content) -> some View {
        content.onAppear {
            guard !didAppear else {return}
            didAppear = true
            action?()
        }
    }
}

extension View {
    func onLoad(_ action: @escaping Closure) -> some View {
        modifier(OnLoadViewModifier(action: action))
    }
}
