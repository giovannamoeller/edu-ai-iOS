//
//  HomeView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 07/11/24.
//

import SwiftUI

enum Tab {
    case chat, essay, simulator, culture
}

struct HomeView: View {
    @State private var selectedTab: Tab = .chat
    let webService = WebService()
    private let webURL = URL(string: "https://hacka-cult-bot-production.up.railway.app/")!
    
    var body: some View {
        TabView(selection: $selectedTab) {
            /*ChatNavigationView()
             .tabItem {
             Label("Chat", systemImage: "message.fill")
             }
             .tag(Tab.chat)*/
            
            EssayHistoryView()
                .tabItem {
                    Label("Redação", systemImage: "doc.text.fill")
                }
                .tag(Tab.essay)
            
            QuizView()
                .tabItem {
                    Label("Simulados", systemImage: "questionmark.circle.fill")
                }
                .tag(Tab.simulator)
            
            CultureView(url: webURL)
                .tabItem {
                    Label("Cultura", systemImage: "photo.artframe")
                }
                .tag(Tab.culture)
        }
        
    }
}

#Preview {
    HomeView()
}
