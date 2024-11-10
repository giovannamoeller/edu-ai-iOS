//
//  Quiz.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 10/11/24.
//

import Foundation

struct Quiz: Codable {
    let question: String
    let alternatives: [String]
    let answer: Int
}
