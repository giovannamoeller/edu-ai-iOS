//
//  SuggestionsView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct SuggestionsView: View {
    let suggestions: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Sugestões de Melhoria")
                .font(.headline)
            
            ForEach(suggestions, id: \.self) { suggestion in
                HStack(alignment: .top) {
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(.yellow)
                    Text(suggestion)
                }
                .padding(.vertical, 4)
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(8)
    }
}

#Preview {
    SuggestionsView(suggestions: ["Sugestão #01", "Sugestão #02"])
}
