//
//  EssayUploadView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct EssayUploadView: View {
    @State private var importing = false
    @ObservedObject var viewModel: EssayCorrectionViewModel
    @State private var essayFile: (URL)?
    
    var body: some View {
        VStack {
            Text("Envie sua redação para correção")
                .font(.headline)
            if let _ = essayFile {
                Text("Redação selecionada com sucesso!")
            } else {
                Button("Import") {
                    importing = true
                }
                .fileImporter(
                    isPresented: $importing,
                    allowedContentTypes: [.pdf, .png, .jpeg, .plainText]
                ) { result in
                    switch result {
                    case .success(let file):
                        essayFile = file
                        print(file.absoluteURL)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
            if let essayFile {
                Button("Enviar para correção") {
                    Task {
                        await viewModel.uploadImage(file: essayFile)
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    EssayUploadView(viewModel: EssayCorrectionViewModel())
}
