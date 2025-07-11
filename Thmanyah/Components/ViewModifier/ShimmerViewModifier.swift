//
//  WebImage.swift
//  Remu
//
//  Created by Muhannad Alnemer on 10/5/22.
//

import SwiftUI

struct ShimmerViewModifier: ViewModifier {
    
    @State var isLoading: Bool = true
    
    func body(content: Content) -> some View {
        content
            .redacted(reason: .placeholder)
            .mask {
                LinearGradient(
                    gradient: .init(colors: [.black.opacity(0.4), .black, .black.opacity(0.4)]),
                    startPoint: (isLoading ? .init(x: -0.3, y: -0.3) : .init(x: 1, y: 1)),
                    endPoint: (isLoading ? .init(x: 0, y: 0) : .init(x: 1.3, y: 1.3))
                )
            }
            .animation(.linear(duration: 1.5).delay(0.25).repeatForever(autoreverses: false), value: isLoading)
            .onAppear() {
                isLoading = false
            }
    }
}


extension View {
    func shimmer(_ isActive: Bool) -> some View {
        self.if(isActive) { view in
            view.modifier(ShimmerViewModifier())
        } else: { view in
            view
        }

    }
}

#Preview {
    Circle()
        .frame(width: 200, height: 200)
        .foregroundStyle(.green)
        .shimmer(true)
}
