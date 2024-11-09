//
//  EssayCorrectionResultView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct EssayCorrectionResultView: View {
    let result: CorrectionResult
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ScoreView(score: result.totalScore)
                ForEach(result.competencies) { competency in
                    CompetencyView(competency: competency)
                }
                if !result.suggestions.isEmpty {
                    SuggestionsView(suggestions: result.suggestions)
                }
            }
            .padding()
        }
    }
}

#Preview {
    EssayCorrectionResultView(result: CorrectionResult(totalScore: 8.5, competencies: [.init(number: 1, description: "A", score: 0.5, feedback: "Oii")], suggestions: ["Oii"]))
}
