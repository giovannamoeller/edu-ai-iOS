//
//  EssayHistoryCardView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 09/11/24.
//

import SwiftUI

struct EssayHistoryCardView: View {
    let id: Int
    let essay: Essay
    
    var percentage: String {
        return String(format: "%.1f%%", totalScore * 10)
    }
    
    var competencyMastery: String {
        guard let feedback = essay.feedback else { return "0%" }
        let grades = feedback.compactMap { $0.grade }
        guard !grades.isEmpty else { return "N/A" } // Avoid division by zero
        let gradesSum = Double(grades.reduce(0, +))
        let averageGrade = gradesSum / Double(grades.count)
        return String(format: "%.0f", averageGrade)
    }
    
    var totalScore: Int {
        return essay.totalScore ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(id) - \(essay.subject)")
                .font(.title2)
                .bold()
            Text("Nota Final: \(totalScore)")
                .foregroundStyle(Color.text)
            Button {
                //
            } label: {
                Text("Detalhes")
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(Color.buttonBackground)
                    .foregroundStyle(.white)
                    .cornerRadius(24.0)
                    .padding(.top, 8)
            }

            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.cardBackground)
        .cornerRadius(16.0)
    }
}

#Preview {
    EssayHistoryCardView(id: 1, essay: Essay(id: "1", rawContent: "", subject: "as consequencias de ficar muito tempo programando", url: "oie", feedback: [CompetencyResult(id: 1, feedback: "oi", grade: 200)], finalFeedback: "aaa", totalScore: 300, createdAt: "", updatedAt: ""))
}
