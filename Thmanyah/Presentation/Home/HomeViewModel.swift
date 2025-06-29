//
//  HomeViewModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import UIKit

class HomeViewModel: HomeViewModelProtocol {
    private let urlOpener: URLOpenerProtocol
    private let homeService: HomeServiceProtocol
    
    init(urlOpener: URLOpenerProtocol, HomeService: HomeServiceProtocol) {
        self.urlOpener = urlOpener
        self.homeService = HomeService
    }
    
    func onChangeLanguage() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return } // TODO: Show error on fail?
        
        urlOpener.open(url)
    }
    
    func onLoad() {
        Task {
            do {
                try await homeService.fetchHomeData()
            } catch {
                
            }
        }
    }
}
