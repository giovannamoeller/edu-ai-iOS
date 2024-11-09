//
//  CompetencyResult.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import Foundation

struct CompetencyResult: Identifiable, Codable {
    let id: Int
    let feedback: String
    let grade: Int
}