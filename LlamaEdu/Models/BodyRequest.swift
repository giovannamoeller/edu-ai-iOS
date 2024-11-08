//
//  BodyRequest.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import Foundation

struct BodyRequest: Codable {
    let messages: [Message]
    let subject: String
}
