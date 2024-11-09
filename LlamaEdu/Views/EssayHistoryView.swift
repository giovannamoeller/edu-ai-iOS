//
//  EssayHistoryView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 09/11/24.
//

import SwiftUI

struct EssayHistoryView: View {
    @StateObject private var viewModel = EssayHistoryViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.state {
                case .idle:
                    EmptyView()
                case .loading:
                    ProgressView("Carregando suas redações...")
                case .success(let essays):
                    ScrollView {
                        ForEach(essays.indices, id: \.self) { index in
                            EssayHistoryCardView(id: index + 1, essay: essays[index])
                        }
                    }
                case .error(let essayCorrectionError):
                    ErrorView(error: essayCorrectionError) {
                        viewModel.state = .idle
                    }
                case .empty:
                    Text("Sua lista de redações está vazia.")
                }
            }
            .navigationTitle("Minhas redações")
            .onAppear {
                Task {
                    await viewModel.getEssays()
                }
            }
        }
    }
}

#Preview {
    EssayHistoryView()
}
