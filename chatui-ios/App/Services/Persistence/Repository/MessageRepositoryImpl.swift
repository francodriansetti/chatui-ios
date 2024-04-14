//
//  MessageRepositoryImpl.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 14/04/24.
//

import Foundation
import RealmSwift

class MessageRepositoryImpl: MessageRepository {
    // Get the Realm instance
    private let realm = RealmManager.shared.getRealm()
    
    // Save a message to the database
    func saveMessage(message: MessageViewModel) {
        guard let realm = realm else { return }
        
        do {
            try realm.write {
                let messageObject = MessageModelRealm()
                messageObject.text = message.text
                messageObject.timestamp = message.timestamp
                messageObject.isSent = message.isSent
                realm.add(messageObject)
            }
        } catch {
            print("Error saving message: \(error.localizedDescription)")
        }
    }
    
    // Retrieve all messages from the database
    func getAllMessages() -> [MessageViewModel] {
        guard let realm = realm else { return [] }
        
        let messages = realm.objects(MessageModelRealm.self)
        return messages.map { MessageViewModel(text: $0.text, timestamp: $0.timestamp, isSent: $0.isSent) }
    }
}
