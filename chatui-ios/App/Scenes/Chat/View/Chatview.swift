//
//  Chatview.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 12/04/24.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject var chatViewModel: ChatViewModel = ChatViewModel()
    
    // MARK: - Private Properties
    
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack {
            ScrollViewReader { scrollView in
                ScrollView {
                    LazyVStack(spacing: 2) {
                        ForEach(chatViewModel.messageViewModels.indices, id: \.self) { index in
                            let messageViewModel = chatViewModel.messageViewModels[index]
                            MessageView(messageViewModel: messageViewModel, chatViewModel: chatViewModel).id(index)
                        }
                    }
                    .padding()
                }
                .onTapGesture {
                    hideKeyboard()
                }
                .onChange(of: chatViewModel.messageViewModels.count, { oldValue, newValue in
                    scrollToBottom(of: scrollView)
                })
                .defaultScrollAnchor(.bottom)
                
                HStack {
                    TextField("Type a message", text: $chatViewModel.inputText, onEditingChanged: { isEditing in
                        if isEditing {
                            isTextFieldFocused = true
                        }
                    }, onCommit: {
                        chatViewModel.sendMessage()
                        isTextFieldFocused = false
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .focused($isTextFieldFocused)
                    
                    
                    Button(action: {
                        chatViewModel.sendMessage()
                    }, label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 20))
                            .padding()
                    })
                }
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    private func scrollToBottom(of scrollView: ScrollViewProxy) {
        scrollView.scrollTo(chatViewModel.messageViewModels.count - 1, anchor: .bottom)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView()
        }
    }
}

