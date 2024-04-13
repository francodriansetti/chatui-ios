//
//  MessageView.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 12/04/24.
//

import SwiftUI

struct MessageView: View {
    var messageViewModel: MessageViewModel
    var chatViewModel: ChatViewModel
    
    var body: some View {
        VStack {
            if shouldDisplayHeader() {
                Text(messageViewModel.formattedDate)
                    .font(.caption)
                    .padding(.top, 8)
            }
            
            HStack {
                if messageViewModel.isSent {
                    Spacer()
                }
                
                Text("\(messageViewModel.text) \(messageViewModel.timestamp)")
                    .padding(10)
                    .background(messageViewModel.isSent ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: messageViewModel.isSent))
                    .padding(.vertical, shouldReducePadding() ? 0 : 20)
                
                if !messageViewModel.isSent {
                    Spacer()
                }
            }
        }
    }
    
    private func shouldReducePadding() -> Bool {
        guard let currentIndex = chatViewModel.messageViewModels.firstIndex(where: { $0.id == messageViewModel.id }) else {
            return false
        }
        
        if currentIndex > 0 {
            let previousMessage = chatViewModel.messageViewModels[currentIndex - 1]
            // TODO: remove debug logs 
            print("Testing: \(previousMessage.text) with current \(messageViewModel.text)")
            let timeDifference = abs(previousMessage.timestamp.timeIntervalSince(messageViewModel.timestamp))
            print("time difference \(timeDifference)")
            print("should reduce: \(timeDifference <= 20)")
            return timeDifference <= 20
        }
        
        return false
    }
    
    private func shouldDisplayHeader() -> Bool {
        guard let currentIndex = chatViewModel.messageViewModels.firstIndex(where: { $0.id == messageViewModel.id }) else {
            return false
        }
        
        if currentIndex > 0 {
            let previousMessage = chatViewModel.messageViewModels[currentIndex - 1]
            let timeDifference = abs(previousMessage.timestamp.timeIntervalSince(messageViewModel.timestamp))
            return timeDifference >= 3600
        }
        
        return false
    }


}

// TODO: Add preview here 
//struct MessageBubble_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView(text: "Hello, how are you?")
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
