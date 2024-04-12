//
//  ChatViewModel.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 12/04/24.
//

import SwiftUI
import SwiftData
import Realm
import RealmSwift

class ChatViewModel: ObservableObject {
    @Published var messageViewModels: [MessageViewModel] = []
    @Published var inputText: String = ""
    
    init() {
        loadMessagesFromRealm()
    }
    
    func loadMessagesFromRealm() {
        do {
            let realm = try Realm()
            let savedMessages = realm.objects(Message.self).sorted(byKeyPath: "timestamp", ascending: true)
            
            // Convert saved messages to MessageViewModels
            let savedMessageViewModels = savedMessages.map { MessageViewModel(text: $0.text, timestamp: $0.timestamp, isSent: true) }
            
            // Load mocked received messages
            let receivedMessages: [MessageViewModel] = [
                MessageViewModel(text: "Ciao!", timestamp: Date().addingTimeInterval(-20), isSent: false),
                MessageViewModel(text: "How are you?", timestamp: Date().addingTimeInterval(-30), isSent: false)
                // Add more received messages as needed
            ]
            
            // Combine received messages with saved messages
            messageViewModels = receivedMessages + savedMessageViewModels
        } catch {
            print("Error loading messages from Realm: \(error.localizedDescription)")
        }
    }
    
    func sendMessage() {
        guard !inputText.isEmpty else { return }
        
        let newMessageViewModel = MessageViewModel(text: inputText, timestamp: Date(), isSent: true)
        messageViewModels.append(newMessageViewModel)
        saveMessageToRealm(text: inputText, timestamp: Date())
        inputText = ""
    }
    
    func saveMessageToRealm(text: String, timestamp: Date) {
        do {
            let realm = try Realm()
            try realm.write {
                let message = Message()
                message.text = text
                message.timestamp = timestamp
                realm.add(message)
            }
        } catch {
            print("Error saving message to Realm: \(error.localizedDescription)")
        }
    }
}
// TODO: move structure 
class Message: Object {
    @objc dynamic var text: String = ""
    @objc dynamic var timestamp: Date = Date()
}

struct MessageData: Codable {
    let text: String
    let timestamp: Date
}

