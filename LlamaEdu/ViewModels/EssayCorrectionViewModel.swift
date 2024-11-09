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
        case success(CorrectionResult)
        case error(EssayCorrectionError)
    }
    
    func uploadImage(file: (URL)) async {
        do {
            
            //let base64String = fileData.base64EncodedString()
            
            let result = try await webService.uploadImage(file: file)
            print(result)
            
        } catch(let error) {
            print("erro burra")
            print(error.localizedDescription)
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
