//
//  SendMessageUseCaseImpl.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 14/04/24.
//

import Foundation

// Use case protocol for sending messages
protocol SendMessageUseCase {
    func sendMessage(text: String, timestamp: Date)
}

class SendMessageUseCaseImpl: SendMessageUseCase {
    private let messageRepository: MessageRepository
    
    init(messageRepository: MessageRepository) {
        self.messageRepository = messageRepository
    }
    
    func sendMessage(text: String, timestamp: Date) {
        let message = MessageViewModel(text: text, timestamp: timestamp, isSent: true)
        messageRepository.saveMessage(message: message)
    }
}
