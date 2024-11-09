//
//  ChatNavigationView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 07/11/24.
//

import SwiftUI

enum Subject: String, CaseIterable {
    case math = "Matemática"
    case portuguese = "Português"
    case history = "História"
    case geography = "Geografia"
    case biology = "Biologia"
    case chemistry = "Química"
    case physics = "Física"
}

struct ChatNavigationView: View {
    @State private var selectedSubject: Subject = .math
    
    var body: some View {
        ChatView(subject: selectedSubject)
            .safeAreaInset(edge: .top) {
                SubjectPickerView(selection: $selectedSubject)
            }
    }
}

#Preview {
    ChatNavigationView()
}
