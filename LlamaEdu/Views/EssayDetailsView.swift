//
//  EssayDetailsView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 09/11/24.
//

import SwiftUI

struct EssayDetailsView: View {
    let essay: Essay
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Nota Final")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    if let score = essay.totalScore {
                        Text("\(score)")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(.accentColor)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.accentColor.opacity(0.1))
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Competências")
                        .font(.headline)
                    
                    if let feedback = essay.feedback {
                        CompetencyView(competency: 1, grade: feedback.competencia1Grade, feedback: feedback.competencia1Feedback)
                        CompetencyView(competency: 2, grade: feedback.competencia2Grade, feedback: feedback.competencia2Feedback)
                        CompetencyView(competency: 3, grade: feedback.competencia3Grade, feedback: feedback.competencia3Feedback)
                        CompetencyView(competency: 4, grade: feedback.competencia4Grade, feedback: feedback.competencia4Feedback)
                        CompetencyView(competency: 5, grade: feedback.competencia5Grade, feedback: feedback.competencia5Feedback)
                    }
                }
                
                if let finalFeedback = essay.finalFeedback {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Feedback Geral")
                            .font(.headline)
                        
                        Text(try! AttributedString(markdown: finalFeedback))
                            .font(.body)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
    }
}

//#Preview {
//EssayDetailsView()
//}
