//
//  QuizQuestionView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 10/11/24.
//

import SwiftUI

struct QuizQuestionView: View {
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            ProgressView(value: viewModel.progress)
                .padding(.horizontal)
            
            if let currentQuestion = viewModel.currentQuestion {
                Text(currentQuestion.quiz.question)
                    .font(.title3)
                    .padding()
                
                ForEach(currentQuestion.quiz.alternatives.indices, id: \.self) { index in
                    Button(action: {
                        viewModel.selectAnswer(index)
                        viewModel.nextQuestion()
                    }) {
                        Text(currentQuestion.quiz.alternatives[index])
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(currentQuestion.selectedAnswer == index ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

#Preview {
    QuizQuestionView(viewModel: QuizViewModel())
}
