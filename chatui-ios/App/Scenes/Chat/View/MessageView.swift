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
            // MARK: - Header
            if shouldDisplayHeader() {
                Text(messageViewModel.timestamp.formattedDate)
                    .font(.caption)
                    .padding(.top, 8)
            }
            
            HStack {
                if messageViewModel.isSent {
                    Spacer()
                }
                
                // MARK: - Message Text
                Text("\(messageViewModel.text)")
                    .padding(10)
                    .background(messageViewModel.isSent ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .clipShape(ChatBubble())
                    .padding(.top, shouldReducePadding() ? 0 : 20)
                
                if !messageViewModel.isSent {
                    Spacer()
                }
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func shouldReducePadding() -> Bool {
        guard let currentIndex = chatViewModel.messageViewModels.firstIndex(where: { $0.id == messageViewModel.id }) else {
            return false
        }
        
        if currentIndex > 0 {
            let previousMessage = chatViewModel.messageViewModels[currentIndex - 1]
            let timeDifference = abs(previousMessage.timestamp.timeIntervalSince(messageViewModel.timestamp))
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

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        let model = MessageViewModel(text: "Ciao", timestamp: Date(), isSent: false)
        let modelChat = ChatViewModel()
        MessageView(messageViewModel: model, chatViewModel: modelChat)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

struct ChatBubble: Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 20)
        return Path(path.cgPath)
    }
}

