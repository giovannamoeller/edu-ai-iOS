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
    @State private var showDetails = false
    
    var totalScore: Int {
        return essay.totalScore ?? 0
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(id) - \(essay.subject)")
                    .foregroundStyle(.primary)
                    .font(.title3)
                    .bold()
                if let score = essay.totalScore {
                    Text("Nota Final: \(score)")
                        .font(.subheadline)
                        .foregroundStyle(Color.text)
                } else {
                    HStack(spacing: 8) {
                        ProgressView()
                            .scaleEffect(0.8)
                            .tint(Color.accentColor)
                        Text("Calculando")
                            .font(.caption)
                            .foregroundColor(Color.accentColor)
                    }
                }
                Button {
                    showDetails = true
                } label: {
                    Text("Detalhes")
                        .font(.caption)
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        .background(Color.buttonBackground)
                        .foregroundStyle(.white)
                        .cornerRadius(24.0)
                        .padding(.top, 8)
                        .opacity(essay.totalScore == nil ? 0.5 : 1.0)
                }
                .disabled(essay.totalScore == nil)
            }
            Spacer()
            if essay.totalScore == nil {
                HStack {
                    Image(systemName: "pencil.and.scribble")
                        .foregroundStyle(Color.accentColor)
                    Text("Sua redação está sendo corrigida!")
                        .font(.caption)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.cardBackground)
        .cornerRadius(16.0)
        .sheet(isPresented: $showDetails) {
            EssayDetailsView(essay: essay)
        }
    }
}

/*#Preview {
 EssayHistoryCardView(id: 1, essay: Essay(id: "01",
 rawContent: "rawContent",
 subject: "Fome",
 url: "URL",
 feedback: Evaluation(totalScore: 700, competencies: [CompetencyFeedback(grade: 200, feedback: "Ótimo", competency: 1)]), finalFeedback: "Ótimo",
 totalScore: 1000,
 createdAt: String(),
 updatedAt: String()))
 }
 */
