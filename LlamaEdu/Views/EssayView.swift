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
        VStack {
            switch viewModel.state {
            case .idle:
                //EssayUploadView(viewModel: viewModel)
                EssayHistoryView()
            case .loading:
                ProgressView("Analisando sua redação...")
            case .success(let result):
                //EssayCorrectionResultView(result: result)
                EssayHistoryView()
            case .error(let error):
                ErrorView(error: error) {
                    viewModel.state = .idle
                }
            }
        }
    }
}

#Preview {
    EssayView()
}
