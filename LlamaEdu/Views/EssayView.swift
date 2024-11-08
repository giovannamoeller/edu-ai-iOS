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
                    Text("Idle")
                case .loading:
                    Text("Loading...")
                case .success:
                    Text("Sucesso!")
                case .error:
                    Text("Erro!")
                }
            }
            .navigationTitle("Correção de Redação")
        }
    }
}

#Preview {
    EssayView()
}
