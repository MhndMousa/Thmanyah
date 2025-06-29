//
//  HomeViewModel.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import UIKit

class HomeViewModel: HomeViewModelProtocol {
    private let urlOpener: URLOpenerProtocol
    
    init(urlOpener: URLOpenerProtocol) {
        self.urlOpener = urlOpener
    }
    
    func onChangeLanguage() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return } // TODO: Show error on fail?
        
        urlOpener.open(url)
    }
}
