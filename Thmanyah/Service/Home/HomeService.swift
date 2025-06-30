//
//  HomeServoce.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

class HomeService: HomeServiceProtocol {
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchHomeData() async throws -> HomeModel {
        
        let request = HomeRequest()
        do {
            let response = try await apiClient.send(request)
            return response
        } catch {
            throw HomeServiceError.failedToFetchHomeData
        }
    }
}
