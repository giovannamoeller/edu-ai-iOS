//
//  CompetencyView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct CompetencyView: View {
    let competency: Int
    let grade: Int
    let feedback: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Competência \(competency)")
                .font(.headline)
            
            Text(Competency.getCompetency(for: competency).description)
                .font(.subheadline)
            
            Text("Nota nesta modalidade: \(grade)")
                .font(.subheadline)
                .foregroundColor(.accentColor)
                .bold()
            
            Text(feedback)
                .font(.caption)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        
    }
}

/*#Preview {
    CompetencyView(competency: CompetencyFeedback(grade: 180, feedback: "Muito bom!", competency: 1))
}
*/
