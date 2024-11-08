//
//  ChatViewModel.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import Foundation

@MainActor
class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = [.init(id: UUID(), text: "Hello, IA!", type: .human, timestamp: Date()),
                                          .init(id: UUID(), text: "Hello, human!", type: .ai, timestamp: Date())]
    @Published var isLoading: Bool = false
    
    func loadPreviousMessages(for subject: Subject) async throws {
        //
    }
    
    func sendMessage(_ text: String, subject: Subject) async {
        let message = Message(id: UUID(), text: text, type: .human, timestamp: Date())
        messages.append(message)
        
    }
}
