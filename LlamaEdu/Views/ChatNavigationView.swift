//
//  ChatNavigationView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 07/11/24.
//

import SwiftUI

enum Subject: String, CaseIterable {
    case matematica = "Matemática"
    case portugues = "Português"
    case historia = "História"
    case geografia = "Geografia"
    case biologia = "Biologia"
    case quimica = "Química"
    case fisica = "Física"
}

struct ChatNavigationView: View {
    let subjects = Subject.allCases
    @State private var selectedSubject = ""
    
    var body: some View {
        Text(selectedSubject)
            .onAppear {
                self.selectedSubject = subjects.first!.rawValue
            }
    }
}

#Preview {
    ChatNavigationView()
}
