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
    
    func fetchHomeData() async throws(HomeServiceError) -> HomeModel {
        
        let request = HomeRequest()
        do {
            let response = try await apiClient.send(request)
            return response
        } catch {
            throw HomeServiceError.failedToFetchHomeData
        }
    }
    
    func loadNextPageData(page: Int) async throws(HomeServiceError) -> HomeModel {
        let request = HomeLoadMorePagesRequest(page: page)
        do {
            let response = try await apiClient.send(request)
            return response
        } catch {
            throw HomeServiceError.failedToLoadMorePages
        }
    }
}
