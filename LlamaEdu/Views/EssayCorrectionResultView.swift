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
                ForEach(result.feedback ?? []) { competency in
                    CompetencyView(competency: competency)
                }
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

#Preview {
    EssayCorrectionResultView(result: Essay(id: "1", rawContent: "a", subject: "Teste", url: "url", feedback: [CompetencyResult(id: 1, feedback: "Muito bom", grade: 200)], finalFeedback: "muito bom", totalScore: 1000, createdAt: "2024-11-09T18:56:25.625Z", updatedAt: "2024-11-09T18:56:25.625Z"))
}
