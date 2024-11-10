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
                        ScrollView(showsIndicators: false) {
                            ForEach(Array(essays.enumerated()), id: \.element.id) { index, essay in
                                EssayHistoryCardView(id: essays.count - index, essay: essay)
                            }
                        }
                        .refreshable {
                            await viewModel.getEssays()
                        }
                    case .error(let essayCorrectionError):
                        ErrorView(error: essayCorrectionError) {
                            Task {
                                await viewModel.getEssays()
                            }
                        }
                    case .empty:
                        VStack(spacing: 16.0) {
                            Image(systemName: "applepencil.and.scribble")
                                .font(.largeTitle)
                                .foregroundStyle(Color.accentColor)
                            
                            Text("Sua lista de redações está vazia.")
                                .font(.title2)
                                .bold()
                            
                            Text("Clique no botão abaixo para importar uma nova redação.")
                                .foregroundStyle(Color.text)
                                .multilineTextAlignment(.center)
                                .font(.body)
                                .fontWeight(.thin)
                        }
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
                                .shadow(color: Color.accentColor, radius: 10, x: 0, y: 4)
                        }
                        .padding(.trailing, 16)
                        .padding(.bottom, 16)
                    }
                }
                
            }
            .padding(.horizontal)
            .navigationTitle("Minhas redações")
            .onAppear {
                Task {
                    await viewModel.getEssays()
                    print(viewModel.essays)
                }
            }
            .sheet(isPresented: $isNewEssaySheetPresented) {
                //
            } content: {
                EssayUploadView()
                    .presentationDetents([.large])
            }
        }
    }
}

#Preview {
    EssayHistoryView()
}
