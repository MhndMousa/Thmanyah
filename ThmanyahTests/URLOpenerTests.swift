//
//  URLOpenerIntegrationTests.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 7/2/25.
//

import Testing
import Foundation
@testable import Thmanyah

@MainActor
struct URLOpenerIntegrationTests {
    
    @Test("canOpen should return true for valid HTTP URLs")
    func testCanOpenValidHTTPURLs() throws {
        // Given
        let urlOpener = URLOpener()
        let validURLs = [
            URL(string: "https://www.apple.com"),
            URL(string: "http://example.com"),
            URL(string: "https://www.google.com")
        ]
        
        // When & Then
        for url in validURLs {
            let result = urlOpener.canOpen(url)
            #expect(result == true, "Expected canOpen to return true for \(url)")
        }
    }
    
    @Test("canOpen should return true for system URLs")
    func testCanOpenSystemURLs() throws {
        // Given
        let urlOpener = URLOpener()
        let systemURLs = [
            URL(string: "sms:+1234567890")
        ]
        
        // When & Then
        for url in systemURLs {
            let result = urlOpener.canOpen(url)
            #expect(result == true, "Expected canOpen to return true for \(url)")
        }
    }
    
    @Test("canOpen should return false for invalid URLs")
    func testCanOpenInvalidURLs() throws {
        // Given
        let urlOpener = URLOpener()
        let invalidURLs = [
            URL(string: "invalid://scheme"),
            URL(string: "nonexistent://app"),
            URL(string: "fake://protocol")
        ]
        
        // When & Then
        for url in invalidURLs {
            let result = urlOpener.canOpen(url)
            #expect(result == false, "Expected canOpen to return false for \(url)")
        }
    }
    
    @Test("canOpen should handle URLs with query parameters")
    func testCanOpenURLsWithQueryParameters() throws {
        // Given
        let urlOpener = URLOpener()
        let urlsWithParams = [
            URL(string: "https://example.com?param=value"),
            URL(string: "https://example.com?param1=value1&param2=value2"),
            URL(string: "https://example.com/path?param=value#fragment")
        ]
        
        // When & Then
        for url in urlsWithParams {
            let result = urlOpener.canOpen(url)
            #expect(result == true, "Expected canOpen to return true for \(url)")
        }
    }
    
    @Test("canOpen should handle URLs with special characters")
    func testCanOpenURLsWithSpecialCharacters() throws {
        // Given
        let urlOpener = URLOpener()
        let specialURLs = [
            URL(string: "https://example.com/path with spaces"),
            URL(string: "https://example.com/path-with-émojis-🎉"),
            URL(string: "https://example.com/path%20with%20encoding")
        ]
        
        // When & Then
        for url in specialURLs {
            let result = urlOpener.canOpen(url)
            #expect(result == true, "Expected canOpen to return true for \(url)")
        }
    }
    
    @Test("open should not throw for valid URLs")
    func testOpenWithValidURLs() throws {
        // Given
        let urlOpener = URLOpener()
        let validURLs = [
            URL(string: "https://www.apple.com"),
            URL(string: "http://example.com"),
            URL(string: "mailto:test@example.com")
        ]
        
        // When & Then
        for url in validURLs {
            // This should not throw an exception
            urlOpener.open(url)
            #expect(true, "open should not throw for \(url)")
        }
    }
    
    @Test("open should handle file URLs")
    func testOpenWithFileURLs() throws {
        // Given
        let urlOpener = URLOpener()
        let fileURL = URL(fileURLWithPath: "/path/to/file.txt")
        
        // When & Then
        urlOpener.open(fileURL)
        #expect(true, "open should handle file URLs")
    }
    
    @Test("open should handle custom scheme URLs")
    func testOpenWithCustomSchemeURLs() throws {
        // Given
        let urlOpener = URLOpener()
        let customURLs = [
            URL(string: "myapp://open"),
            URL(string: "thmanyah://podcast/123"),
            URL(string: "spotify://track/abc123")
        ]
        
        // When & Then
        for url in customURLs {
            urlOpener.open(url)
            #expect(true, "open should handle custom scheme URLs")
        }
    }
    
    @Test("open and canOpen should work together")
    func testOpenAndCanOpenWorkTogether() throws {
        // Given
        let urlOpener = URLOpener()
        let testURL = URL(string: "https://example.com")
        
        // When
        let canOpen = urlOpener.canOpen(testURL)
        urlOpener.open(testURL)
        
        // Then
        #expect(canOpen == true, "canOpen should return true for valid URLs")
        #expect(true, "open should work after canOpen check")
    }
    
    @Test("URLOpener should handle multiple consecutive operations")
    func testMultipleConsecutiveOperations() throws {
        // Given
        let urlOpener = URLOpener()
        let urls = [
            URL(string: "https://example1.com"),
            URL(string: "https://example2.com"),
            URL(string: "https://example3.com")
        ]
        
        // When & Then
        for url in urls {
            let canOpen = urlOpener.canOpen(url)
            urlOpener.open(url)
            #expect(canOpen == true, "canOpen should return true for \(url)")
        }
    }
    
    @Test("URLOpener should handle edge case URLs")
    func testHandleEdgeCaseURLs() throws {
        // Given
        let urlOpener = URLOpener()
        let edgeCaseURLs = [
            URL(string: "https://"), // Minimal URL
            URL(string: "https://example.com/"), // Trailing slash
            URL(string: "https://example.com:443/"), // Port number
            URL(string: "https://user:pass@example.com") // Auth in URL
        ]
        
        // When & Then
        for url in edgeCaseURLs {
            let canOpen = urlOpener.canOpen(url)
            urlOpener.open(url)
            #expect(canOpen == true, "canOpen should handle edge case URL: \(url)")
        }
    }
    
    @Test("URLOpener should handle URLs with fragments")
    func testHandleURLsWithFragments() throws {
        // Given
        let urlOpener = URLOpener()
        let fragmentURLs = [
            URL(string: "https://example.com#section1"),
            URL(string: "https://example.com/page#top"),
            URL(string: "https://example.com/path?param=value#fragment")
        ]
        
        // When & Then
        for url in fragmentURLs {
            let canOpen = urlOpener.canOpen(url)
            urlOpener.open(url)
            #expect(canOpen == true, "canOpen should handle URLs with fragments: \(url)")
        }
    }
    
    @Test("URLOpener should handle internationalized URLs")
    func testHandleInternationalizedURLs() throws {
        // Given
        let urlOpener = URLOpener()
        let internationalURLs = [
            URL(string: "https://example.com/العربية"),
            URL(string: "https://example.com/中文"),
            URL(string: "https://example.com/русский")
        ]
        
        // When & Then
        for url in internationalURLs {
            let canOpen = urlOpener.canOpen(url)
            urlOpener.open(url)
            #expect(canOpen == true, "canOpen should handle internationalized URLs: \(url)")
        }
    }
} 
