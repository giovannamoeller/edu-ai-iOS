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
                //
                
            }
        }
    }
}

#Preview {
    EssayCorrectionResultView(result: CorrectionResult(totalScore: 100, competencies: [.init(number: 1, description: "A", score: 0.5, feedback: "Oii")], suggestions: ["Oii"]))
}
