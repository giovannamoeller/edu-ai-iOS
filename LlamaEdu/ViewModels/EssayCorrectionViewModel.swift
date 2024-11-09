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
        case success(EssayCorrectionResult)
        case error(EssayCorrectionError)
    }
    
    func uploadImage(file: (URL)) async {
        state = .loading
        do {
            let result = try await webService.uploadImage(file: file)
            await MainActor.run {
                state = .success(result)
            }
        } catch {
            await MainActor.run {
                if let _ = error as? APIError {
                    state = .error(.other(error.localizedDescription))
                }
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
