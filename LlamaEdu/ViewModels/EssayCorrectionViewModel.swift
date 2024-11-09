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
        state = .loading
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
