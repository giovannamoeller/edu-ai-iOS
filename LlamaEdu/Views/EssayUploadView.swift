//
//  EssayUploadView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct EssayUploadView: View {
    @State private var importing = false
    @StateObject var viewModel: EssayCorrectionViewModel = EssayCorrectionViewModel()
    @State private var essayFile: (URL)?
    @Environment(\.dismiss) private var dismiss
    @State private var subject: String = ""
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                uploadContent
            case .loading:
                ProgressView("Analisando redação...")
            case .success:
                // Automatically dismiss and return to history view
                Color.clear.onAppear {
                    dismiss()
                }
            case .error(let error):
                ErrorView(error: error) {
                    self.essayFile = nil
                    viewModel.state = .idle
                }
            }
        }
    }
    
    private var uploadContent: some View {
        VStack {
            Text("Envie sua redação")
                .font(.largeTitle)
                .bold()
            CustomTextField(
                placeholder: "Assunto da redação",
                text: $subject
            )
            Text("Toque abaixo para importar seu texto e enviar para correção.")
                .multilineTextAlignment(.center)
                .padding()
                .font(.title3)
            
            if let essayFile {
                VStack(spacing: 16) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Text("Redação selecionada com sucesso!")
                            .foregroundColor(.green)
                    }
                    
                    Button {
                        Task {
                            await viewModel.uploadImage(
                                file: essayFile,
                                subject: subject
                            )
                        }
                    } label: {
                        Image(systemName: "arrow.up")
                        Text("Enviar para correção")
                    }
                    .disabled(subject.trimmingCharacters(in: .whitespaces).isEmpty)
                    .font(.body)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24.0)
                    .padding(.vertical, 12.0)
                    .background(subject.trimmingCharacters(in: .whitespaces).isEmpty ?
                                Color.gray : Color.accentColor)
                    .cornerRadius(32.0)
                    .padding(.vertical)
                }
            } else {
                Button {
                    importing = true
                } label: {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("Importar redação")
                    }
                    .font(.body)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24.0)
                    .padding(.vertical, 12.0)
                    .background(subject.trimmingCharacters(in: .whitespaces).isEmpty ?
                                Color.gray : Color.accentColor)
                    .cornerRadius(32.0)
                    .padding(.vertical)
                }
                .disabled(subject.trimmingCharacters(in: .whitespaces).isEmpty)
            }
        }
        .fileImporter(
            isPresented: $importing,
            allowedContentTypes: [.pdf, .png, .jpeg]
        ) { result in
            switch result {
            case .success(let file):
                withAnimation {
                    essayFile = file
                }
            case .failure:
                withAnimation {
                    viewModel.state = .error(.invalidImage)
                }
            }
        }
    }
}

#Preview {
    EssayUploadView()
}
