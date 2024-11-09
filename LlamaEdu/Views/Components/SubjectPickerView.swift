//
//  SubjectPickerView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct SubjectPickerView: View {
    @Binding var selection: Subject
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Subject.allCases, id: \.self) { subject in
                    Button(subject.rawValue) {
                        self.selection = subject
                    }
                    .padding()
                    .background(selection == subject ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                }
            }
        }
    }
}

#Preview {
    SubjectPickerView(selection: .constant(.biology))
}
