//
//  QueueView.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/1/25.
//

import SwiftUI

struct QueueView: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
            Spacer()
            VStack {
                playNow
                HStack {
                    timeLeft
                    dateStarted
                }
            }
            Spacer()
            playButton
        }
        .padding()
        .background(
            Color.backgroundColorWeak
        )
        .cornerRadius(20)
    }
    
    private var playButton: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "play.circle.fill")
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundColor(Color.textColor)
        })
    }
    
    private var timeLeft: some View {
        Text("Time Left")
            .font(.footnote)
            .foregroundStyle(.orange)
    }
    
    private var playNow: some View {
        Text("Playing now")
            .font(.subtitles.weight(.bold))
            .foregroundStyle(Color.textColor)
    }
    
    private var dateStarted: some View {
        Text("\(RelativeDateTimeFormatter().localizedString(for: .init(timeIntervalSinceNow: -250), relativeTo: .now))")
            .font(.footnote)
            .foregroundStyle(Color.textColorWeak)
    }
}


#Preview {
    QueueView()
}
