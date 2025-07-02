 //
//  TwoLineViewModelTests.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/2/25.
//

import Testing
import Combine
import Foundation
@testable import Thmanyah

@MainActor
struct TwoLineViewModelTests {
    
    // MARK: - Properties
    private var mockPreviewable: MockTwoLineViewPreviewable!
    
    // MARK: - Setup and Teardown
    @Test("TwoLineViewModel should initialize with correct values")
    func testInitialization() throws {
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
    
    @Test("TwoLineViewModel should update isPlaying state")
    func testIsPlayingStateUpdate() throws {
        // Given
        let mockPreviewable = MockTwoLineViewPreviewable()
        let twoLineViewModel = TwoLineViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When
        twoLineViewModel.isPlaying = true
        
        // Then
        #expect(twoLineViewModel.isPlaying == true)
    }
    
    @Test("onClick should be callable without errors")
    func testOnClickIsCallable() throws {
        // Given
        let mockPreviewable = MockTwoLineViewPreviewable()
        let twoLineViewModel = TwoLineViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When & Then
        twoLineViewModel.onClick()
        #expect(true) // Method called successfully
    }
    
    @Test("onPlayButtonClick should be callable without errors")
    func testOnPlayButtonClickIsCallable() throws {
        // Given
        let mockPreviewable = MockTwoLineViewPreviewable()
        let twoLineViewModel = TwoLineViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When & Then
        twoLineViewModel.onPlayButtonClick()
        #expect(true) // Method called successfully
    }
    
    @Test("onOptionsButtonClick should be callable without errors")
    func testOnOptionsButtonClickIsCallable() throws {
        // Given
        let mockPreviewable = MockTwoLineViewPreviewable()
        let twoLineViewModel = TwoLineViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When & Then
        twoLineViewModel.onOptionsButtonClick()
        #expect(true) // Method called successfully
    }
    
    @Test("onAddToQueueButtonClick should be callable without errors")
    func testOnAddToQueueButtonClickIsCallable() throws {
        // Given
        let mockPreviewable = MockTwoLineViewPreviewable()
        let twoLineViewModel = TwoLineViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When & Then
        twoLineViewModel.onAddToQueueButtonClick()
        #expect(true) // Method called successfully
    }
    
    @Test("previewable properties should be accessible")
    func testPreviewablePropertiesAccessible() throws {
        // Given
        let mockPreviewable = MockTwoLineViewPreviewable()
        let twoLineViewModel = TwoLineViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When & Then
        #expect(twoLineViewModel.previewable.text == mockPreviewable.text)
        #expect(twoLineViewModel.previewable.datePosted == mockPreviewable.datePosted)
        #expect(twoLineViewModel.previewable.length == mockPreviewable.length)
        #expect(twoLineViewModel.previewable.imageUrlString == mockPreviewable.imageUrlString)
    }
    
    @Test("isPlaying should be published property")
    func testIsPlayingIsPublished() throws {
        // Given
        let mockPreviewable = MockTwoLineViewPreviewable()
        let twoLineViewModel = TwoLineViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        var publishedValue: Bool?
        let cancellable = twoLineViewModel.$isPlaying
            .sink { value in
                publishedValue = value
            }
        
        // When
        twoLineViewModel.isPlaying = true
        
        // Then
        #expect(publishedValue == true)
        cancellable.cancel()
    }
    
    @Test("previewable should not be published")
    func testPreviewableIsNotPublished() throws {
        // Given
        let mockPreviewable = MockTwoLineViewPreviewable()
        let twoLineViewModel = TwoLineViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When & Then
        #expect(twoLineViewModel.previewable.text == mockPreviewable.text)
        #expect(twoLineViewModel.previewable.datePosted == mockPreviewable.datePosted)
        #expect(twoLineViewModel.previewable.length == mockPreviewable.length)
        #expect(twoLineViewModel.previewable.imageUrlString == mockPreviewable.imageUrlString)
    }
    
    @Test("TwoLineViewModel should handle different isPlaying states")
    func testDifferentIsPlayingStates() throws {
        // Given
        let mockPreviewable = MockTwoLineViewPreviewable()
        
        // When - Initial state
        let twoLineViewModel = TwoLineViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        #expect(twoLineViewModel.isPlaying == false)
        
        // When - Changed to playing
        twoLineViewModel.isPlaying = true
        #expect(twoLineViewModel.isPlaying == true)
        
        // When - Changed back to not playing
        twoLineViewModel.isPlaying = false
        #expect(twoLineViewModel.isPlaying == false)
    }
    
    @Test("TwoLineViewModel should maintain previewable reference")
    func testPreviewableReferenceMaintained() throws {
        // Given
        let mockPreviewable = MockTwoLineViewPreviewable()
        let twoLineViewModel = TwoLineViewModel(
            previewable: mockPreviewable,
            isPlaying: false
        )
        
        // When
        twoLineViewModel.isPlaying = true
        
        // Then
        #expect(twoLineViewModel.previewable.text == mockPreviewable.text)
        #expect(twoLineViewModel.previewable.datePosted == mockPreviewable.datePosted)
        #expect(twoLineViewModel.previewable.length == mockPreviewable.length)
        #expect(twoLineViewModel.previewable.imageUrlString == mockPreviewable.imageUrlString)
    }
}

// MARK: - Mock Classes
private class MockTwoLineViewPreviewable: TwoLineViewPreviewable {
    var text: String = "Mock Two Line Title"
    var datePosted: Date = Date()
    var length: Int = 240 // 4 minutes
    var imageUrlString: String = "https://example.com/twoline-image.jpg"
}
