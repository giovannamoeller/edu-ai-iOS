//
//  QuizView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 10/11/24.
//

import SwiftUI

struct QuizView: View {
    @StateObject private var viewModel = QuizViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20.0) {
                if viewModel.quizResults.isEmpty {
                    QuizStartView(viewModel: viewModel)
                } else if viewModel.isQuizCompleted {
                    QuizResultsView(viewModel: viewModel)
                } else {
                    QuizQuestionView(viewModel: viewModel)
                }
            }
            .padding()
        }
    }
}

#Preview {
    QuizView()
}
