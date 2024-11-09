//
//  CorrectionResult.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import Foundation

struct Essay: Identifiable, Codable {
    let id: String
    let rawContent: String?
    let subject: String
    let url: String
    let feedback: [CompetencyResult]?
    let finalFeedback: String?
    let totalScore: Int?
    let createdAt: String
    let updatedAt: String
    
    /*enum CodingKeys: String, CodingKey {
        case id
        case rawContent = "raw_content"
        case url
        case feedback
        case finalFeedback = "final_feedback"
        case totalScore = "total_score"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }*/
}
