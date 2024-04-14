//
//  LoadMessagesUseCase.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 14/04/24.
//

import Foundation

// Use case protocol for loading messages
protocol LoadMessagesUseCase {
    func loadMessages() -> [MessageViewModel]
}

class LoadMessagesUseCaseImpl: LoadMessagesUseCase {
    private let messageRepository: MessageRepository
    
    init(messageRepository: MessageRepository) {
        self.messageRepository = messageRepository
    }
    
    func loadMessages() -> [MessageViewModel] {
        return messageRepository.getAllMessages()
    }
}
