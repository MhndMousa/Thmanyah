//
//  HomeServoce.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

protocol HomeServiceProtocol {
    func fetchHomeData() async throws
}

class HomeService: HomeServiceProtocol {
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchHomeData() async throws {
        
        let request = HomeRequest()
        do {
            let response = try await apiClient.send(request)
            
        } catch {
            print(error)
        }
    }
}
