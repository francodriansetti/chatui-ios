//
//  Chatview.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 12/04/24.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject var chatViewModel: ChatViewModel = ChatViewModel()
    
    // MARK: Private property
    private var scrollToBottom = false
    @FocusState private var hideKeyboard: Bool
    var body: some View {
        VStack {
            ScrollViewReader { value in
                ScrollView {
                    LazyVStack(spacing: 2) {
                        ForEach(chatViewModel.messageViewModels.indices, id: \.self) { index in
                            let messageViewModel = chatViewModel.messageViewModels[index]
                            MessageView(messageViewModel: messageViewModel, chatViewModel: chatViewModel).id(index).onTapGesture {
                                hideKeyboard = false
                            }
                        }
                    }
                    .padding()
                }.defaultScrollAnchor(.bottom)
                    .onTapGesture {
                        hideKeyboard = false
                    }
                
                HStack {
                    TextField("Type a message", text: $chatViewModel.inputText, onCommit: chatViewModel.sendMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .focused($hideKeyboard)
                    Button(action: {
                        chatViewModel.sendMessage()
                        value.scrollTo(chatViewModel.messageViewModels.count, anchor: .bottom)
                    }
                           , label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 20))
                            .padding()
                    })
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
