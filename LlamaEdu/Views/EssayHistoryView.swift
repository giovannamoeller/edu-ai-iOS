//
//  EssayHistoryView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 09/11/24.
//

import SwiftUI

struct EssayHistoryView: View {
    @StateObject private var viewModel = EssayHistoryViewModel()
    @State private var isNewEssaySheetPresented = false
    
    var body: some View {
        NavigationStack {
            ZStack {
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
                            .font(.title2)
                            .bold()
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            isNewEssaySheetPresented = true
                        } label: {
                            Image(systemName: "plus")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 56, height: 56)
                                .background(Color.accentColor)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding(.leading, 16)
                        .padding(.bottom, 16) // Add some space above tab bar
                    }
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
