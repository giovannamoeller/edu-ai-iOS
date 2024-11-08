//
//  MessageBubbleView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct MessageBubbleView: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.type == .human {
                Spacer()
            }
            
            Text(message.text)
                .padding()
                .background(message.type == .human ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(20)
            
            if message.type == .ai {
                Spacer()
            }
        }
    }
}

#Preview {
    VStack {
        MessageBubbleView(message: Message(id: UUID(), text: "Hello, AI!", type: .human, timestamp: Date()))
        MessageBubbleView(message: Message(id: UUID(), text: "Hello, human!", type: .ai, timestamp: Date()))
    }
}
