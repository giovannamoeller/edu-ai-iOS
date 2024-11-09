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
            Text("Competência \(competency.id)")
                .font(.headline)
            
            Text("descricao da competencia 1 tambem")
                .font(.subheadline)
            
            Text("Nota: \(String(format: "%.1f", competency.grade))")
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
    CompetencyView(competency: Competency(id: 1, feedback: "Muito bom!", grade: 180))
}
