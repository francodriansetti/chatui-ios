//
//  MessageView.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 12/04/24.
//

import SwiftUI

struct MessageView: View {
    var messageViewModel: MessageViewModel
    
    var body: some View {
        HStack {
            if messageViewModel.isSent {
                Spacer()
            }
            
            Text(messageViewModel.text)
                .padding(10)
                .background(messageViewModel.isSent ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .clipShape(ChatBubble(isFromCurrentUser: messageViewModel.isSent))
            
            if !messageViewModel.isSent {
                Spacer()
            }
        }
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
