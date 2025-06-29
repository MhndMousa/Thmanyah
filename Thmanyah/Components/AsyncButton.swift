//
//  AsyncButton.swift
//  Remu
//
//  Created by Muhannad Alnemer on 6/15/25.
//

import SwiftUI

struct AsyncButton<Label: View>: View {
    var action: AsyncClosure
    var label: ReturnTypeClosure<Label>
    
    @State private var isPerformingTask = false
    
    init(action: @escaping AsyncClosure, @ViewBuilder label: @escaping ReturnTypeClosure<Label>) {
        self.action = action
        self.label = label
    }
    
    var body: some View {
        Button {
            isPerformingTask = true
            
            Task {
                await action()
                isPerformingTask = false
            }
        } label: {
            ZStack {
                label()
                    .opacity(isPerformingTask ? 0 : 1)
                
                if isPerformingTask {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        }
        .disabled(isPerformingTask)
    }
}

// MARK: - Convenience Initializers

// Text-only button
extension AsyncButton where Label == Text {
    init(_ title: String, action: @escaping AsyncClosure) {
        self.init(action: action) {
            Text(title)
        }
    }
}

// Icon-only button
extension AsyncButton where Label == Image {
    init(systemName: String, action: @escaping AsyncClosure) {
        self.init(action: action) {
            Image(systemName: systemName)
        }
    }
}

// Label with icon and text
extension AsyncButton where Label == SwiftUI.Label<Text, Image> {
    init(systemName: String, title: String, action: @escaping AsyncClosure) {
        self.init(action: action) {
            Label(title, systemImage: systemName)
        }
    }
}

// Custom image button
extension AsyncButton where Label == Image {
    init(image: Image, action: @escaping AsyncClosure) {
        self.init(action: action) {
            image
        }
    }
}

// Label with View` button
extension AsyncButton  {
    init(@ViewBuilder label: @escaping () -> Label, action: @escaping AsyncClosure) {
        self.init(action: action) {
            label()
        }
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: 20) {
        // Text button
        AsyncButton("Text Button") {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
        }
        
        // Icon button
        AsyncButton(systemName: "arrow.up.circle") {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
        }
        
        // Label with icon and text
        AsyncButton(systemName: "square.and.arrow.up", title: "Upload") {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
        }
        
        // Custom image button
        AsyncButton(image: Image(systemName: "photo")) {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
        }
    }
    .padding()
}
