//
//  CustomTextField.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 09/11/24.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Digite o assunto principal da redação")
                .font(.subheadline)
                .foregroundColor(.gray)
                .fontWeight(.thin)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom)
            
            TextField(placeholder, text: $text)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(12)
                .autocapitalization(.sentences)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CustomTextField(placeholder: "Assunto", text: .constant(""))
}
