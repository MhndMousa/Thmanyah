//
//  HomeViewModelTests.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/2/25.
//

import Testing
import Combine
import Foundation
import UIKit
@testable import Thmanyah

@MainActor
struct HomeViewModelTests {
    
    // MARK: - Properties
    private var cancellables: Set<AnyCancellable>!
    
    // MARK: - Setup and Teardown
    @Test("HomeViewModel should initialize with correct default values")
    func testInitialization() throws {
        // Given
        var mockHomeService = MockHomeService()
        var mockURLOpenerSpy = MockURLOpenerSpy()
        var mockAudioPlayer = MockAudioPlayer()
        
        // When
        let homeViewModel = HomeViewModel(
            urlOpener: mockURLOpenerSpy,
            homeService: mockHomeService,
            audioPlayer: mockAudioPlayer
        )
        
        // Then
        #expect(homeViewModel.isLoading == true)
        #expect(homeViewModel.topPodcasts.name.isEmpty == false)
        #expect(homeViewModel.trendingPodcasts.name.isEmpty == false)
        #expect(homeViewModel.bestSellingAudiobooks.name.isEmpty == false)
        #expect(homeViewModel.mustReadAudioArticles.name.isEmpty == false)
        #expect(homeViewModel.newPodcasts.name.isEmpty == false)
        #expect(homeViewModel.editorsPick.name.isEmpty == false)
        #expect(homeViewModel.popularAudiobooks.name.isEmpty == false)
    }
    
    @Test("onLoad should fetch home data successfully")
    func testOnLoadFetchesHomeDataSuccessfully() async throws {
        // Given
        let mockHomeService = MockHomeService()
        let mockURLOpenerSpy = MockURLOpenerSpy()
        let mockAudioPlayer = MockAudioPlayer()
        
        let expectedHomeModel = createMockHomeModel()
        mockHomeService.shouldSucceed = true
        mockHomeService.mockHomeModel = expectedHomeModel
        
        let homeViewModel = HomeViewModel(
            urlOpener: mockURLOpenerSpy,
            homeService: mockHomeService,
            audioPlayer: mockAudioPlayer
        )
        
        // When
         await homeViewModel.onLoad()
        
        // Then
        #expect(mockHomeService.fetchHomeDataCallCount == 1)
        #expect(homeViewModel.isLoading == false)
    }
    
    @Test("onLoad should handle service errors gracefully")
    func testOnLoadHandlesServiceErrors() async throws {
        // Given
        let mockHomeService = MockHomeService()
        let mockURLOpenerSpy = MockURLOpenerSpy()
        let mockAudioPlayer = MockAudioPlayer()
        
        mockHomeService.shouldSucceed = false
        mockHomeService.mockError = HomeServiceError.failedToFetchHomeData
        
        let homeViewModel = HomeViewModel(
            urlOpener: mockURLOpenerSpy,
            homeService: mockHomeService,
            audioPlayer: mockAudioPlayer
        )
        
        // When
        await homeViewModel.onLoad()
        
        // Then
        #expect(mockHomeService.fetchHomeDataCallCount == 1)
        #expect(homeViewModel.isLoading == false)
    }
    
    @Test("onChangeLanguage should open settings URL")
    func testOnChangeLanguageOpensSettingsURL() throws {
        // Given
        let mockHomeService = MockHomeService()
        let mockURLOpenerSpy = MockURLOpenerSpy()
        let mockAudioPlayer = MockAudioPlayer()
        
        let homeViewModel = HomeViewModel(
            urlOpener: mockURLOpenerSpy,
            homeService: mockHomeService,
            audioPlayer: mockAudioPlayer
        )
        
        // When
        homeViewModel.onChangeLanguage()
        
        // Then
        #expect(mockURLOpenerSpy.openURLCallCount == 1)
        #expect(mockURLOpenerSpy.lastOpenedURL?.absoluteString == UIApplication.openSettingsURLString)
    }
    
    @Test("onReachingEndOfList should load next page data")
    func testOnReachingEndOfListLoadsNextPage() async throws {
        // Given
        let mockHomeService = MockHomeService()
        let mockURLOpenerSpy = MockURLOpenerSpy()
        let mockAudioPlayer = MockAudioPlayer()
        
        let expectedHomeModel = createMockHomeModel()
        mockHomeService.shouldSucceed = true
        mockHomeService.mockHomeModel = expectedHomeModel
        
        let homeViewModel = HomeViewModel(
            urlOpener: mockURLOpenerSpy,
            homeService: mockHomeService,
            audioPlayer: mockAudioPlayer
        )
        
        // When
        await homeViewModel.onReachingEndOfList()
        
        // Then
        #expect(mockHomeService.loadNextPageDataCallCount == 1)
        #expect(mockHomeService.lastRequestedPage == 2)
        #expect(homeViewModel.isLoading == false)
    }
    
    @Test("onReachingEndOfList should handle pagination errors")
    func testOnReachingEndOfListHandlesPaginationErrors() async throws {
        // Given
        let mockHomeService = MockHomeService()
        let mockURLOpenerSpy = MockURLOpenerSpy()
        let mockAudioPlayer = MockAudioPlayer()
        
        mockHomeService.shouldSucceed = false
        mockHomeService.mockError = HomeServiceError.failedToLoadMorePages
        
        let homeViewModel = HomeViewModel(
            urlOpener: mockURLOpenerSpy,
            homeService: mockHomeService,
            audioPlayer: mockAudioPlayer
        )
        
        // When
        await homeViewModel.onReachingEndOfList()
        
        // Then
        #expect(mockHomeService.loadNextPageDataCallCount == 1)
        #expect(homeViewModel.isLoading == false)
    }
    
    // MARK: - Helper Methods
    private func createMockHomeModel() -> HomeModel {
        .StubFactory.stub()
    }
}

// MARK: - Mock Classes
private class MockHomeService: HomeServiceProtocol {
    var shouldSucceed = true
    var mockHomeModel: HomeModel?
    var mockError: HomeServiceError?
    var fetchHomeDataCallCount = 0
    var loadNextPageDataCallCount = 0
    var lastRequestedPage: Int?
    
    func fetchHomeData() async throws(HomeServiceError) -> HomeModel {
        fetchHomeDataCallCount += 1
        
        if shouldSucceed {
            return mockHomeModel ?? .StubFactory.stub()
        } else {
            throw mockError ?? HomeServiceError.failedToFetchHomeData
        }
    }
    
    func loadNextPageData(page: Int) async throws(HomeServiceError) -> HomeModel {
        loadNextPageDataCallCount += 1
        lastRequestedPage = page
        
        if shouldSucceed {
            return mockHomeModel ?? .StubFactory.stub()
        } else {
            throw mockError ?? HomeServiceError.failedToLoadMorePages
        }
    }
}

private class MockURLOpenerSpy: URLOpenerProtocol {
    var openURLCallCount = 0
    var canOpenURLCallCount = 0
    var lastOpenedURL: URL?
    var lastCanOpenURL: URL?
    var canOpenURLResult = true
    
    func open(_ url: URL?) {
        openURLCallCount += 1
        lastOpenedURL = url
    }
    
    func canOpen(_ url: URL?) -> Bool {
        canOpenURLCallCount += 1
        lastCanOpenURL = url
        return canOpenURLResult
    }
}

private class MockAudioPlayer: AudioPlayerProtocol {
    var currentTrackId: String?
    var isPlaying: Bool = false
    var queue: [String] = []
    
    func play() {}
    func pause() {}
    func nextTrack() {}
    func previousTrack() {}
    func addToQueue(_ trackId: String) {
        queue.append(trackId)
    }
} 
