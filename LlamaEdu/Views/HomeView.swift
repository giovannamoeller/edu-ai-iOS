//
//  HomeView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 07/11/24.
//

import SwiftUI

enum Tab {
    case chat, essay
}

struct HomeView: View {
    @State private var selectedTab: Tab = .chat

    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                Text("Helo!")
            }
        }
    }
}

#Preview {
    HomeView()
}
