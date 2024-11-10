//
//  EssayCorrectionResultView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct EssayCorrectionResultView: View {
    let result: Essay
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ScoreView(score: result.totalScore ?? 0)
                //CompetencyView(competency: 1,
                               //grade: result.feedback?.competencia1Grade,
                               //feedback: result.feedback?.competencia1Feedback)
                /*if !result.suggestions.isEmpty {
                    SuggestionsView(suggestions: result.suggestions)
                }*/
            }
            .padding()
        }
        .onAppear {
            print(result)
        }
    }
}

/*#Preview {
    EssayCorrectionResultView(result: Essay(id: "01",
                                            rawContent: "rawContent",
                                            subject: "Fome",
                                            url: "URL",
                                            feedback: Evaluation(totalScore: 700, competencies: [CompetencyFeedback(grade: 200, feedback: "Ótimo", competency: 1)]), finalFeedback: "Ótimo",
                                            totalScore: 1000,
                                            createdAt: String(),
                                            updatedAt: String()))
}*/
