//
//  Competency.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import Foundation

struct Competency: Identifiable {
    let id = UUID()
    let number: Int
    let description: String
    let score: Double
    let feedback: String
}
