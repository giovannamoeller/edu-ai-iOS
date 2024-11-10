//
//  QuizResult.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 10/11/24.
//

import Foundation

struct QuizResult {
    let quiz: Quiz
    var selectedAnswer: Int?
    var isCorrect: Bool {
        selectedAnswer == quiz.answer
    }
}
