//
//  EssayView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 07/11/24.
//

import SwiftUI

struct EssayView: View {
    @StateObject private var viewModel = EssayCorrectionViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.state {
                case .idle:
                    EssayUploadView(viewModel: viewModel)
                case .loading:
                    ProgressView("Analisando sua redação...")
                case .success:
                    EssayCorrectionResultView()
                case .error:
                    ErrorView()
                }
            }
            .navigationTitle("Correção de Redação")
        }
    }
}

#Preview {
    EssayView()
}
