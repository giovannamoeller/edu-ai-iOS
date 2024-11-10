//
//  QuestionResultView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 10/11/24.
//

import SwiftUI

struct QuestionResultView: View {
    let result: QuizResult
    let index: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Questão \(index + 1)")
                .font(.headline)
            
            Text(result.quiz.question)
                .padding(.bottom, 5)
            
            ForEach(result.quiz.alternatives.indices, id: \.self) { i in
                HStack {
                    Text(result.quiz.alternatives[i])
                    Spacer()
                    if i == result.quiz.answer {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    } else if i == result.selectedAnswer && i != result.quiz.answer {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                    }
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(getBackgroundColor(for: i))
                )
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
    
    private func getBackgroundColor(for index: Int) -> Color {
        if index == result.quiz.answer {
            return Color.green.opacity(0.1)
        } else if index == result.selectedAnswer && index != result.quiz.answer {
            return Color.red.opacity(0.1)
        }
        return Color.clear
    }
}
