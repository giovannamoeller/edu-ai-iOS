//
//  QuizViewModel.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 10/11/24.
//

import SwiftUI

@MainActor
class QuizViewModel: ObservableObject {
    private let webService: WebService
    
    @Published var subject: String = ""
    @Published var quizResults: [QuizResult] = []
    @Published var currentQuestionIndex: Int = 0
    @Published var isQuizCompleted: Bool = false
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    var currentQuestion: QuizResult? {
        guard currentQuestionIndex < quizResults.count else { return nil }
        return quizResults[currentQuestionIndex]
    }
    
    var progress: Double {
        guard !quizResults.isEmpty else { return 0 }
        return Double(currentQuestionIndex + 1) / Double(quizResults.count)
    }
    
    var score: Int {
        quizResults.filter { $0.isCorrect }.count
    }
    
    init(webService: WebService = WebService()) {
        self.webService = webService
    }
    
    func startQuiz() async {
        guard !subject.isEmpty else {
            errorMessage = "Por favor, insira um assunto."
            return
        }
        
        isLoading = true
        errorMessage = nil
        do {
            let quizzes = try await webService.generateQuiz(subject: subject)
            quizResults = quizzes.map { QuizResult(quiz: $0, selectedAnswer: nil )}
            currentQuestionIndex = 0
            isQuizCompleted = false
        } catch {
            withAnimation {
                errorMessage = error.localizedDescription
            }
        }
        
        isLoading = false
    }
    
    func selectAnswer(_ index: Int) {
        guard currentQuestionIndex < quizResults.count else { return }
        quizResults[currentQuestionIndex].selectedAnswer = index
    }
    
    func nextQuestion() {
        if currentQuestionIndex < quizResults.count - 1 {
            currentQuestionIndex += 1
        } else {
            withAnimation {
                isQuizCompleted = true
            }
        }
    }
    
    func reset() {
        withAnimation {
            subject = ""
            quizResults = []
            currentQuestionIndex = 0
            isQuizCompleted = false
            errorMessage = nil
        }
    }
}
