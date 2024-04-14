//
//  MessageRepository.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 14/04/24.
//

import Foundation

protocol MessageRepository {
    // Save a message to the repository
    func saveMessage(message: MessageViewModel)
    
    // Retrieve all messages from the repository
    func getAllMessages() -> [MessageViewModel]
}
