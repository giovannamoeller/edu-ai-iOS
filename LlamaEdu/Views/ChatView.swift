//
//  ChatView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct ChatView: View {
    let subject: Subject
    @StateObject private var viewModel = ChatViewModel()
    @State private var newMessage = ""
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.messages) { message in
                        //MessageBubble(message: message)
                        Text(message.text)
                    }
                }
                .padding()
            }
        }
        .task {
            try? await viewModel.loadPreviousMessages(for: subject)
        }
    }
}

#Preview {
    ChatView(subject: .biologia)
}
