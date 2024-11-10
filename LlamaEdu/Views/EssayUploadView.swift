//
//  EssayUploadView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI
import PhotosUI

struct EssayUploadView: View {
    @State private var importing = false
    @State private var showImagePicker = false
    @State private var showSourceActionSheet = false
    @State private var showCamera = false
    @StateObject var viewModel: EssayCorrectionViewModel = EssayCorrectionViewModel()
    @State private var essayFile: URL?
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
                description: "Digite o assunto principal da redação.",
                text: $subject
            )
            .padding()
            
            Text("Escolha uma forma de enviar sua redação")
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
                VStack(spacing: 16.0) {
                    Button {
                        showCamera = true
                    } label: {
                        HStack {
                            Spacer()
                            Image(systemName: "camera")
                            Text("Tirar foto")
                            Spacer()
                        }
                        .font(.body)
                        .frame(maxWidth: 240)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal, 24.0)
                        .padding(.vertical, 12.0)
                        .background(subject.trimmingCharacters(in: .whitespaces).isEmpty ?
                                    Color.gray : Color.accentColor)
                        .cornerRadius(32.0)
                    }
                    .disabled(subject.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                
                Button {
                    showImagePicker = true
                } label: {
                    HStack {
                        Spacer()
                        Image(systemName: "photo.on.rectangle")
                        Text("Escolher da galeria")
                        Spacer()
                    }
                    .frame(maxWidth: 240)
                    .font(.body)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24.0)
                    .padding(.vertical, 12.0)
                    .background(subject.trimmingCharacters(in: .whitespaces).isEmpty ?
                                Color.gray : Color.accentColor)
                    .cornerRadius(32.0)
                }
                .disabled(subject.trimmingCharacters(in: .whitespaces).isEmpty)
                
                Button {
                    importing = true
                } label: {
                    HStack {
                        Spacer()
                        Image(systemName: "doc")
                        Text("Importar arquivo")
                        Spacer()
                    }
                    .frame(maxWidth: 240)
                    .font(.body)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24.0)
                    .padding(.vertical, 12.0)
                    .background(subject.trimmingCharacters(in: .whitespaces).isEmpty ?
                                Color.gray : Color.accentColor)
                    .cornerRadius(32.0)
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
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary) { image in
                if let url = saveImageTemporarily(image) {
                    essayFile = url
                }
            }
        }
        .fullScreenCover(isPresented: $showCamera) {
            ImagePicker(sourceType: .camera) { image in
                if let url = saveImageTemporarily(image) {
                    essayFile = url
                }
            }
        }
    }
    
    private func saveImageTemporarily(_ image: UIImage) -> URL? {
        guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }
        let tempDir = FileManager.default.temporaryDirectory
        let fileName = UUID().uuidString + ".jpg"
        let fileURL = tempDir.appendingPathComponent(fileName)
        
        do {
            try data.write(to: fileURL)
            return fileURL
        } catch {
            print("Error saving image:", error)
            return nil
        }
    }
}

#Preview {
    EssayUploadView()
}


struct ImagePicker: UIViewControllerRepresentable {
    let sourceType: UIImagePickerController.SourceType
    let onImagePicked: (UIImage) -> Void
    
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.onImagePicked(image)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
