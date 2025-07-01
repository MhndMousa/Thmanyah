//
//  AppComponents.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation

class AppComponents {
    static let urlOpener: URLOpener = {
        return URLOpener()
    }()
    
    static let audioPlayer: AudioPlayerProtocol = {
        return AudioPlayer(queue: [])
    }()
    
}
    
// MARK: Network
extension AppComponents {
    static let urlSession : URLSession = {
        return URLSession.shared
    }()
    
    static let apiClient: APIClientProtocol = {
        return APIClient(client: urlSession)
    }()
}

// MARK: Services
extension AppComponents {
    static let homeService: HomeService = {
        return HomeService(apiClient: apiClient)
    }()
}
