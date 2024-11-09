//
//  HomeView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 07/11/24.
//

import SwiftUI

enum Tab {
    case chat, essay, simulator
}

struct HomeView: View {
    @State private var selectedTab: Tab = .chat
    let webService = WebService()
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                /*ChatNavigationView()
                 .tabItem {
                 Label("Chat", systemImage: "message.fill")
                 }
                 .tag(Tab.chat)*/
                
                EssayView()
                    .tabItem {
                        Label("Redação", systemImage: "doc.text.fill")
                    }
                    .tag(Tab.essay)
                
                SimulatorGeneratorView()
                    .tabItem {
                        Label("Simulados", systemImage: "questionmark.circle.fill")
                    }
                    .tag(Tab.simulator)
            }
        }
        .onAppear {
            Task {
                do {
                    try await webService.test()
                } catch {
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
