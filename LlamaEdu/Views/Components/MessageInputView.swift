//
//  MessageInputView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var message: String
    let onSend: () async -> Void
    
    var body: some View {
        HStack {
            TextField("Digite sua mensagem...", text: $message)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                Task {
                    await onSend()
                }
            } label: {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.title)
            }
            .disabled(message.isEmpty)
        }
        .padding()
    }
}

#Preview {
    MessageInputView(message: .constant("Hello, World!"),
                     onSend: {})
}
