//
//  QuizResultsView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 10/11/24.
//

import SwiftUI

struct QuizResultsView: View {
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                Text("Resultado Final")
                    .font(.title)
                    .bold()
                
                Text("Acertos: \(viewModel.score) de \(viewModel.quizResults.count)")
                    .foregroundStyle(Color.accentColor)
                    .font(.title2)
                    .bold()
                
                ForEach(viewModel.quizResults.indices, id: \.self) { index in
                    let result = viewModel.quizResults[index]
                    QuestionResultView(result: result, index: index)
                }
                
                Button(action: viewModel.reset) {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("Novo simulado")
                    }
                    .font(.body)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24.0)
                    .padding(.vertical, 12.0)
                    .background(Color.accentColor)
                    .cornerRadius(32.0)
                    .padding(.vertical)
                }
            }
        }
    }
}

#Preview {
    QuizResultsView(viewModel: QuizViewModel())
}
