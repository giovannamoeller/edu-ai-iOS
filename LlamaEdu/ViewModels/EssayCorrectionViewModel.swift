//
//  EssayCorrectionViewModel.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

@MainActor
class EssayCorrectionViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var state: CorrectionState = .idle
    
    enum CorrectionState {
        case idle
        case loading
        case success(CorrectionResult)
        case error(EssayCorrectionError)
    }
    
    func uploadImage(file: (URL)) async {
        state = .success(.init(totalScore: 100, competencies: [Competency(number: 1,
                                                                          description: "Competência #01",
                                                                          score: 7.0,
                                                                          feedback: "Feedback #01"),
                                                               Competency(number: 2,
                                                                          description: "Competência #02",
                                                                          score: 8.0,
                                                                          feedback: "Feedback #02")],
                               suggestions: ["Sugestão #01", "Sugestão #02"]))
        //
    }
    
    private func checkImageReadability() async {
        //
    }
    
    private func uploadToS3() async {
        //
    }
    
    private func getCorrectionResult() async {
        //
    }
}
