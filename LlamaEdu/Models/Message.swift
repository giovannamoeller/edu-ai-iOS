//
//  Message.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import Foundation

struct Message: Identifiable, Codable {
    let id: UUID
    let text: String
    let type: MessageType
    let timestamp: Date
    
    enum MessageType: String, Codable {
        case human = "HumanMessage"
        case ai = "AIMessage"
    }
}
