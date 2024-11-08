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
    @State private var selectedSubject: Subject = .matematica
    
    var body: some View {
        VStack {
            SubjectPickerView(selection: $selectedSubject)
            Text(selectedSubject.rawValue)
        }
            
    }
}

#Preview {
    ChatNavigationView()
}
