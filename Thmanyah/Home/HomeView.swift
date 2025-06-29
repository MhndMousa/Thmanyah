//
//  ContentView.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import SwiftUI



struct HomeView<ViewModel>: View where ViewModel: HomeViewModelProtocol {
    private let viewModel: ViewModel
    let name = "Muhannad" // TODO: Remove this eventually, this is only here for localization testing
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            Spacer()
            Text("Hello \(name)")
            Spacer()
            Button("Change the language") {
                viewModel.onChangeLanguage()
            }
            AsyncButton("Call Service") {
                viewModel.onLoad()
            }
        }
    }
}

#Preview {
    class Fixture: HomeViewModelProtocol {
        func onChangeLanguage() {}
        func onLoad() {}
    }
    
    return HomeView(
        viewModel: Fixture()
    )
}
