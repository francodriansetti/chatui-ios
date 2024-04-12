//
//  Chatview.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 12/04/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject var chatViewModel: ChatViewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(chatViewModel.messageViewModels) { messageViewModel in
                        MessageView(messageViewModel: messageViewModel)
                    }
                }
                .padding()
            }
            
            HStack {
                TextField("Type a message", text: $chatViewModel.inputText, onCommit: chatViewModel.sendMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: chatViewModel.sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 20))
                        .padding()
                }
            }
        }
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView()
        }
    }
}

struct ChatBubble: Shape {
    var isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 20)
        return Path(path.cgPath)
    }
}
