//
//  ThmanyahApp.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import SwiftUI

@main
struct ThmanyahApp: App {
    init() {
        Font.setup(fontName: "Thmanyah")
    }
    var body: some Scene {
        WindowGroup {
            HomeView(
                viewModel: HomeViewModel(
                    urlOpener: AppComponents.urlOpener,
                    homeService: AppComponents.homeService,
                    audioPlayer: AppComponents.audioPlayer
                )
            )
        }
    }
}
