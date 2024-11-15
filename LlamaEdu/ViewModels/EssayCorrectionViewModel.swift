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
    let webService: WebService = WebService()
    
    enum CorrectionState {
        case idle
        case loading
        case success(Essay)
        case error(EssayCorrectionError)
    }
    
    func uploadImage(file: (URL), subject: String) async {
        state = .loading
        do {
            let result = try await webService.uploadImage(file: file, subject: subject)
            state = .success(result)
        } catch {
            if let _ = error as? APIError {
                print(error.localizedDescription)
                state = .error(.other(error.localizedDescription))
            }
        }
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
