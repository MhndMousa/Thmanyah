//
//  CarouselView.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation
import SwiftUI

struct CarouselView<Content: View>: View {
    
    var content: ReturnTypeClosure<Content>
    var isAtTheEndOfCarousel: Bool = false
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        content()
            .gesture(
                DragGesture()
                    .onEnded({ _ in
                        
                    })
            )
    }
}

#Preview {
    CarouselView {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 300, height: 200)
            .foregroundStyle(.green)
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 300, height: 200)
            .foregroundStyle(.blue)
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 300, height: 200)
            .foregroundStyle(.red)
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 300, height: 200)
            .foregroundStyle(.brown)
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 300, height: 200)
            .foregroundStyle(.yellow)
    }
}
