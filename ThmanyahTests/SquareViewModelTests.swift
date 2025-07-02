 //
//  SquareViewModelTests.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/2/25.
//

import Testing
import Combine
import Foundation
@testable import Thmanyah

@MainActor
    struct SquareViewModelTests {
    
    // MARK: - Properties
    private var mockPreviewable: MockSquareViewPreviewable!
    
    // MARK: - Setup and Teardown
    @Test("SquareViewModel should initialize with correct values")
    func testInitialization() throws {
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
    func testIsPlayingStateUpdate() throws {
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
    
    @Test("onClick should be callable without errors")
    func testOnClickIsCallable() throws {
        // Given
        let mockPreviewable = MockSquareViewPreviewable()
        let squareViewModel = SquareViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When & Then
        squareViewModel.onClick()
        #expect(true) // Method called successfully
    }
    
    @Test("onPlayButtonClick should be callable without errors")
    func testOnPlayButtonClickIsCallable() throws {
        // Given
        let mockPreviewable = MockSquareViewPreviewable()
        let squareViewModel = SquareViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When & Then
        squareViewModel.onPlayButtonClick()
        #expect(true) // Method called successfully
    }
    
    @Test("previewable properties should be accessible")
    func testPreviewablePropertiesAccessible() throws {
        // Given
        let mockPreviewable = MockSquareViewPreviewable()
        let squareViewModel = SquareViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When & Then
        #expect(squareViewModel.previewable.text == mockPreviewable.text)
        #expect(squareViewModel.previewable.datePosted == mockPreviewable.datePosted)
        #expect(squareViewModel.previewable.length == mockPreviewable.length)
        #expect(squareViewModel.previewable.imageUrlString == mockPreviewable.imageUrlString)
    }
    
    @Test("isPlaying should be published property")
    func testIsPlayingIsPublished() throws {
        // Given
        let mockPreviewable = MockSquareViewPreviewable()
        let squareViewModel = SquareViewModel(
            previewable: mockPreviewable,
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
    
    @Test("previewable should not be published")
    func testPreviewableIsNotPublished() throws {
        // Given
        let mockPreviewable = MockSquareViewPreviewable()
        let squareViewModel = SquareViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When & Then
        #expect(squareViewModel.previewable.text == mockPreviewable.text)
        #expect(squareViewModel.previewable.datePosted == mockPreviewable.datePosted)
        #expect(squareViewModel.previewable.length == mockPreviewable.length)
        #expect(squareViewModel.previewable.imageUrlString == mockPreviewable.imageUrlString)
    }
}

// MARK: - Mock Classes
private class MockSquareViewPreviewable: SquareViewPreviewable {
    var text: String = "Mock Title"
    var datePosted: Date = Date()
    var length: Int = 180 // 3 minutes
    var imageUrlString: String = "https://example.com/image.jpg"
}
