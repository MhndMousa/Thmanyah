//
//  BigSquareViewModelTests.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/2/25.
//

import Testing
import Combine
import Foundation
@testable import Thmanyah

@MainActor
struct BigSquareViewModelTests {
    
    // MARK: - Properties
    private var mockPreviewable: MockBigSquareViewPreviewable!
    
    // MARK: - Setup and Teardown
    @Test("BigSquareViewModel should initialize with correct values")
    func testInitialization() throws {
        // Given
        let mockPreviewable = MockBigSquareViewPreviewable()
        
        // When
        let bigSquareViewModel = BigSquareViewModel(previewable: mockPreviewable)
        
        // Then
        #expect(bigSquareViewModel.previewable.title == mockPreviewable.title)
        #expect(bigSquareViewModel.previewable.subtitle == mockPreviewable.subtitle)
        #expect(bigSquareViewModel.previewable.imageUrlString == mockPreviewable.imageUrlString)
    }
    
    @Test("onClick should be callable without errors")
    func testOnClickIsCallable() throws {
        // Given
        let mockPreviewable = MockBigSquareViewPreviewable()
        let bigSquareViewModel = BigSquareViewModel(previewable: mockPreviewable)
        
        // When & Then
        bigSquareViewModel.onClick()
        #expect(true) // Method called successfully
    }
    
    @Test("previewable properties should be accessible")
    func testPreviewablePropertiesAccessible() throws {
        // Given
        let mockPreviewable = MockBigSquareViewPreviewable()
        let bigSquareViewModel = BigSquareViewModel(previewable: mockPreviewable)
        
        // When & Then
        #expect(bigSquareViewModel.previewable.title == mockPreviewable.title)
        #expect(bigSquareViewModel.previewable.subtitle == mockPreviewable.subtitle)
        #expect(bigSquareViewModel.previewable.imageUrlString == mockPreviewable.imageUrlString)
    }
    
    @Test("previewable should be mutable")
    func testPreviewableIsMutable() throws {
        // Given
        let mockPreviewable1 = MockBigSquareViewPreviewable()
        let mockPreviewable2 = MockBigSquareViewPreviewable()
        let bigSquareViewModel = BigSquareViewModel(previewable: mockPreviewable1)
        
        // When
        bigSquareViewModel.previewable = mockPreviewable2
        
        // Then
        #expect(bigSquareViewModel.previewable.title == mockPreviewable2.title)
        #expect(bigSquareViewModel.previewable.subtitle == mockPreviewable2.subtitle)
        #expect(bigSquareViewModel.previewable.imageUrlString == mockPreviewable2.imageUrlString)
    }
    
    @Test("BigSquareViewModel should handle different previewables")
    func testDifferentPreviewables() throws {
        // Given
        let mockPreviewable1 = MockBigSquareViewPreviewable()
        mockPreviewable1.title = "First Title"
        mockPreviewable1.subtitle = "First Subtitle"
        
        let mockPreviewable2 = MockBigSquareViewPreviewable()
        mockPreviewable2.title = "Second Title"
        mockPreviewable2.subtitle = "Second Subtitle"
        
        let bigSquareViewModel = BigSquareViewModel(previewable: mockPreviewable1)
        
        // When & Then - Initial state
        #expect(bigSquareViewModel.previewable.title == "First Title")
        #expect(bigSquareViewModel.previewable.subtitle == "First Subtitle")
        
        // When - Change previewable
        bigSquareViewModel.previewable = mockPreviewable2
        
        // Then - Updated state
        #expect(bigSquareViewModel.previewable.title == "Second Title")
        #expect(bigSquareViewModel.previewable.subtitle == "Second Subtitle")
    }
    
    @Test("BigSquareViewModel should maintain previewable reference after onClick")
    func testPreviewableReferenceMaintainedAfterOnClick() throws {
        // Given
        let mockPreviewable = MockBigSquareViewPreviewable()
        let bigSquareViewModel = BigSquareViewModel(previewable: mockPreviewable)
        
        // When
        bigSquareViewModel.onClick()
        
        // Then
        #expect(bigSquareViewModel.previewable.title == mockPreviewable.title)
        #expect(bigSquareViewModel.previewable.subtitle == mockPreviewable.subtitle)
        #expect(bigSquareViewModel.previewable.imageUrlString == mockPreviewable.imageUrlString)
    }
    
    @Test("BigSquareViewModel should handle empty previewable properties")
    func testEmptyPreviewableProperties() throws {
        // Given
        let mockPreviewable = MockBigSquareViewPreviewable()
        mockPreviewable.title = ""
        mockPreviewable.subtitle = ""
        mockPreviewable.imageUrlString = ""
        
        // When
        let bigSquareViewModel = BigSquareViewModel(previewable: mockPreviewable)
        
        // Then
        #expect(bigSquareViewModel.previewable.title.isEmpty)
        #expect(bigSquareViewModel.previewable.subtitle.isEmpty)
        #expect(bigSquareViewModel.previewable.imageUrlString.isEmpty)
    }
    
    @Test("BigSquareViewModel should handle long previewable properties")
    func testLongPreviewableProperties() throws {
        // Given
        let mockPreviewable = MockBigSquareViewPreviewable()
        let longTitle = String(repeating: "A", count: 100)
        let longSubtitle = String(repeating: "B", count: 200)
        let longImageUrl = String(repeating: "C", count: 300)
        
        mockPreviewable.title = longTitle
        mockPreviewable.subtitle = longSubtitle
        mockPreviewable.imageUrlString = longImageUrl
        
        // When
        let bigSquareViewModel = BigSquareViewModel(previewable: mockPreviewable)
        
        // Then
        #expect(bigSquareViewModel.previewable.title == longTitle)
        #expect(bigSquareViewModel.previewable.subtitle == longSubtitle)
        #expect(bigSquareViewModel.previewable.imageUrlString == longImageUrl)
    }
}

// MARK: - Mock Classes
private class MockBigSquareViewPreviewable: BigSquareViewPreviewable {
    var title: String = "Mock Big Square Title"
    var subtitle: String = "Mock Big Square Subtitle"
    var imageUrlString: String = "https://example.com/bigsquare-image.jpg"
} 
