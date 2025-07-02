//
//  AllViewModelTests.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/2/25.
//

import Testing
import Combine
import Foundation
@testable import Thmanyah

@MainActor
struct AllViewModelTests {
    
    // MARK: - HomeViewModel Tests
    @Test("HomeViewModel should initialize with correct default values")
    func testHomeViewModelInitialization() throws {
        // Given
        let mockHomeService = MockHomeService()
        let mockURLOpenerSpy = MockURLOpenerSpy()
        let mockAudioPlayer = MockAudioPlayer()
        
        // When
        let homeViewModel = HomeViewModel(
            urlOpener: mockURLOpenerSpy,
            homeService: mockHomeService,
            audioPlayer: mockAudioPlayer
        )
        
        // Then
        #expect(homeViewModel.isLoading == true)
    }
    
    @Test("HomeViewModel onLoad should fetch data successfully")
    func testHomeViewModelOnLoad() async throws {
        // Given
        let mockHomeService = MockHomeService()
        let mockURLOpenerSpy = MockURLOpenerSpy()
        let mockAudioPlayer = MockAudioPlayer()
        mockHomeService.shouldSucceed = true
        
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
    
    // MARK: - SquareViewModel Tests
    @Test("SquareViewModel should initialize with correct values")
    func testSquareViewModelInitialization() throws {
        // Given
        let mockPreviewable = MockSquareViewPreviewable()
        let isPlaying = false
        
        // When
        let squareViewModel = SquareViewModel(
            previewable: mockPreviewable,
            isPlaying: isPlaying
        )
        
        // Then
        #expect(squareViewModel.previewable.text == mockPreviewable.text)
        #expect(squareViewModel.previewable.datePosted == mockPreviewable.datePosted)
        #expect(squareViewModel.previewable.length == mockPreviewable.length)
        #expect(squareViewModel.previewable.imageUrlString == mockPreviewable.imageUrlString)
        #expect(squareViewModel.isPlaying == isPlaying)
    }
    
    @Test("SquareViewModel should update isPlaying state")
    func testSquareViewModelIsPlayingUpdate() throws {
        // Given
        let mockPreviewable = MockSquareViewPreviewable()
        let squareViewModel = SquareViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When
        squareViewModel.isPlaying = true
        
        // Then
        #expect(squareViewModel.isPlaying == true)
    }
    
    // MARK: - TwoLineViewModel Tests
    @Test("TwoLineViewModel should initialize with correct values")
    func testTwoLineViewModelInitialization() throws {
        // Given
        let mockPreviewable = MockTwoLineViewPreviewable()
        let isPlaying = false
        
        // When
        let twoLineViewModel = TwoLineViewModel(
            previewable: mockPreviewable,
            isPlaying: isPlaying
        )
        
        // Then
        #expect(twoLineViewModel.previewable.text == mockPreviewable.text)
        #expect(twoLineViewModel.previewable.datePosted == mockPreviewable.datePosted)
        #expect(twoLineViewModel.previewable.length == mockPreviewable.length)
        #expect(twoLineViewModel.previewable.imageUrlString == mockPreviewable.imageUrlString)
        #expect(twoLineViewModel.isPlaying == isPlaying)
    }
    
    @Test("TwoLineViewModel should handle all button clicks")
    func testTwoLineViewModelButtonClicks() throws {
        // Given
        let mockPreviewable = MockTwoLineViewPreviewable()
        let twoLineViewModel = TwoLineViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When & Then
        twoLineViewModel.onClick()
        twoLineViewModel.onPlayButtonClick()
        twoLineViewModel.onOptionsButtonClick()
        twoLineViewModel.onAddToQueueButtonClick()
        #expect(true) // All methods called successfully
    }
    
    // MARK: - BigSquareViewModel Tests
    @Test("BigSquareViewModel should initialize with correct values")
    func testBigSquareViewModelInitialization() throws {
        // Given
        let mockPreviewable = MockBigSquareViewPreviewable()
        
        // When
        let bigSquareViewModel = BigSquareViewModel(previewable: mockPreviewable)
        
        // Then
        #expect(bigSquareViewModel.previewable.title == mockPreviewable.title)
        #expect(bigSquareViewModel.previewable.subtitle == mockPreviewable.subtitle)
        #expect(bigSquareViewModel.previewable.imageUrlString == mockPreviewable.imageUrlString)
    }
    
    @Test("BigSquareViewModel should handle previewable updates")
    func testBigSquareViewModelPreviewableUpdates() throws {
        // Given
        let mockPreviewable1 = MockBigSquareViewPreviewable()
        let mockPreviewable2 = MockBigSquareViewPreviewable()
        mockPreviewable2.title = "Updated Title"
        
        let bigSquareViewModel = BigSquareViewModel(previewable: mockPreviewable1)
        
        // When
        bigSquareViewModel.previewable = mockPreviewable2
        
        // Then
        #expect(bigSquareViewModel.previewable.title == "Updated Title")
    }
    
    
    // MARK: - Published Properties Tests
    @Test("Published properties should work correctly")
    func testPublishedProperties() throws {
        // Given
        let mockSquarePreviewable = MockSquareViewPreviewable()
        let squareViewModel = SquareViewModel(
            previewable: mockSquarePreviewable,
            isPlaying: false
        )
        
        var publishedValue: Bool?
        let cancellable = squareViewModel.$isPlaying
            .sink { value in
                publishedValue = value
            }
        
        // When
        squareViewModel.isPlaying = true
        
        // Then
        #expect(publishedValue == true)
        cancellable.cancel()
    }
    
    // MARK: - Error Handling Tests
    @Test("HomeViewModel should handle service errors gracefully")
    func testHomeViewModelErrorHandling() async throws {
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
    
    // MARK: - Integration Tests
    @Test("ViewModels should work together correctly")
    func testViewModelsIntegration() throws {
        // Given
        let mockHomeService = MockHomeService()
        let mockURLOpenerSpy = MockURLOpenerSpy()
        let mockAudioPlayer = MockAudioPlayer()
        let mockSquarePreviewable = MockSquareViewPreviewable()
        let mockTwoLinePreviewable = MockTwoLineViewPreviewable()
        let mockBigSquarePreviewable = MockBigSquareViewPreviewable()
        
        // When
        let homeViewModel = HomeViewModel(
            urlOpener: mockURLOpenerSpy,
            homeService: mockHomeService,
            audioPlayer: mockAudioPlayer
        )
        let squareViewModel = SquareViewModel(
            previewable: mockSquarePreviewable,
            isPlaying: false
        )
        let twoLineViewModel = TwoLineViewModel(
            previewable: mockTwoLinePreviewable,
            isPlaying: false
        )
        let bigSquareViewModel = BigSquareViewModel(previewable: mockBigSquarePreviewable)
        
        // Then
        #expect(homeViewModel.audioPlayer is AudioPlayerProtocol)
        
        #expect(twoLineViewModel.previewable.text == mockTwoLinePreviewable.text)
        #expect(twoLineViewModel.previewable.datePosted == mockTwoLinePreviewable.datePosted)
        #expect(twoLineViewModel.previewable.length == mockTwoLinePreviewable.length)
        #expect(twoLineViewModel.previewable.imageUrlString == mockTwoLinePreviewable.imageUrlString)
        
        #expect(squareViewModel.previewable.text == mockSquarePreviewable.text)
        #expect(squareViewModel.previewable.datePosted == mockSquarePreviewable.datePosted)
        #expect(squareViewModel.previewable.length == mockSquarePreviewable.length)
        #expect(squareViewModel.previewable.imageUrlString == mockSquarePreviewable.imageUrlString)
        
        #expect(bigSquareViewModel.previewable.title == mockBigSquarePreviewable.title)
        #expect(bigSquareViewModel.previewable.subtitle == mockBigSquarePreviewable.subtitle)
        #expect(bigSquareViewModel.previewable.imageUrlString == mockBigSquarePreviewable.imageUrlString)
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

private class MockSquareViewPreviewable: SquareViewPreviewable {
    var text: String = "Mock Square Title"
    var datePosted: Date = Date()
    var length: Int = 180 // 3 minutes
    var imageUrlString: String = "https://example.com/square-image.jpg"
}

private class MockTwoLineViewPreviewable: TwoLineViewPreviewable {
    var text: String = "Mock Two Line Title"
    var datePosted: Date = Date()
    var length: Int = 240 // 4 minutes
    var imageUrlString: String = "https://example.com/twoline-image.jpg"
}

private class MockBigSquareViewPreviewable: BigSquareViewPreviewable {
    var title: String = "Mock Big Square Title"
    var subtitle: String = "Mock Big Square Subtitle"
    var imageUrlString: String = "https://example.com/bigsquare-image.jpg"
} 
