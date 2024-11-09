//
//  CompetencyView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct CompetencyView: View {
    let competency: Competency
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Competência \(competency.number)")
                .font(.headline)
            
            Text(competency.description)
                .font(.subheadline)
            
            Text("Nota: \(String(format: "%.1f", competency.score))")
                .font(.title3)
                .foregroundColor(.blue)
            
            Text(competency.feedback)
                .font(.body)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        
    }
}

#Preview {
    CompetencyView(competency: Competency(number: 1, description: "Competência 1", score: 6.0, feedback: "Muito bom!"))
}
