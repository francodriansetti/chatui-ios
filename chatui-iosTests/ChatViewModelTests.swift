//
//  ChatViewModelTests.swift
//  chatui-iosTests
//
//  Created by Franco Driansetti on 14/04/24.
//

import XCTest
@testable import chatui_ios

class ChatViewModelTests: XCTestCase {
    
    var chatViewModel: ChatViewModel!
    var initialMessageCount = 0
    override func setUp() {
        super.setUp()
        chatViewModel = ChatViewModel()
    }
    
    override func tearDown() {
        chatViewModel = nil
        super.tearDown()
    }
    
    
    func testSendMessage() {
        // Given
        initialMessageCount = chatViewModel.messageViewModels.count
        
        // When
        chatViewModel.inputText = "Hello, world!"
        chatViewModel.sendMessage()
        
        // Then
        XCTAssertEqual(chatViewModel.messageViewModels.count, initialMessageCount + 1)
        XCTAssertEqual(chatViewModel.inputText, "")
        XCTAssertEqual(chatViewModel.messageViewModels.last?.text, "Hello, world!")
        
        // Additional test cases
        chatViewModel.inputText = "" // Empty message
        chatViewModel.sendMessage()
        XCTAssertEqual(chatViewModel.messageViewModels.count, initialMessageCount + 1) // Message should not be added
        
        chatViewModel.inputText = "  " // Whitespace message
        chatViewModel.sendMessage()
        XCTAssertEqual(chatViewModel.messageViewModels.count, initialMessageCount + 2) // Message should not be added
        
        chatViewModel.inputText = "Another message"
        chatViewModel.sendMessage()
        XCTAssertEqual(chatViewModel.messageViewModels.count, initialMessageCount + 3) // New message should be added
        
        // Test emoji
        chatViewModel.inputText = "😊"
        chatViewModel.sendMessage()
        XCTAssertEqual(chatViewModel.messageViewModels.last?.text, "😊") // Message with emoji
    }
    
    
    func testLoadMessages() {
        // Given
        // initialMessageCount
        
        // When
        chatViewModel.loadMessages()
        
        // Then
        XCTAssertGreaterThan(chatViewModel.messageViewModels.count, initialMessageCount)
    }

    
}

