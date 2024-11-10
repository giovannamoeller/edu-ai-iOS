//
//  QuizStartView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 10/11/24.
//

import SwiftUI

struct QuizStartView: View {
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Teste seus conhecimentos através de simulados")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            CustomTextField(placeholder: "Ex: Análise combinatória, primeira guerra mundial, etc.",
                            description: "Digite o assunto que você quer estudar abaixo.",
                            text: $viewModel.subject)
            
            Button(action: {
                Task {
                    await viewModel.startQuiz()
                }
            }) {
                HStack {
                    Image(systemName: "arrow.right")
                    Text("Iniciar simulado")
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
            
            if viewModel.isLoading {
                ProgressView()
            }
            
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    QuizStartView(viewModel: QuizViewModel())
}
