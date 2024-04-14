//
//  ChatViewModel.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 12/04/24.
//

import SwiftUI

class ChatViewModel: ObservableObject {
    
    @Published var messageViewModels: [MessageViewModel] = []
    @Published var inputText: String = ""
    
    private let sendMessageUseCase: SendMessageUseCase
    private let loadMessagesUseCase: LoadMessagesUseCase
    
    init(sendMessageUseCase: SendMessageUseCase = SendMessageUseCaseImpl(messageRepository: MessageRepositoryImpl()), loadMessagesUseCase: LoadMessagesUseCase = LoadMessagesUseCaseImpl(messageRepository: MessageRepositoryImpl())) {
        self.sendMessageUseCase = sendMessageUseCase
        self.loadMessagesUseCase = loadMessagesUseCase
        loadMessages()
    }
    
    /// Mock data as we don't have API to receive messages
    private func loadMessages() {
        let savedMessages = loadMessagesUseCase.loadMessages()
        
        // Mocked received messages
        let receivedMessages: [MessageViewModel] = [
            MessageViewModel(text: "Ciao!", timestamp: Date().addingTimeInterval(-20), isSent: false),
            MessageViewModel(text: "How are you?", timestamp: Date().addingTimeInterval(-30), isSent: false)
        ]
        
        messageViewModels = receivedMessages + savedMessages
    }
    
    func sendMessage() {
        guard !inputText.isEmpty else { return }
        
        sendMessageUseCase.sendMessage(text: inputText, timestamp: Date())
        loadMessages() // Reload messages after sending a new one
        inputText = ""
    }
}
