//
//  MessageViewModel.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 12/04/24.
//

import Foundation

class MessageViewModel: Identifiable {
    let id = UUID()
    let text: String
    let timestamp: Date
    let isSent: Bool
    
    init(text: String, timestamp: Date, isSent: Bool) {
        self.text = text
        self.timestamp = timestamp
        self.isSent = isSent
    }
    
    
}
