//
//  ContentView.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import SwiftUI



struct HomeView<ViewModel>: View where ViewModel: HomeViewModelProtocol {
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Home")
    }
}

#Preview {
    class Fixture: HomeViewModelProtocol {}
    
    return HomeView(
        viewModel: Fixture()
    )
}
