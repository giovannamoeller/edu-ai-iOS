//
//  ScoreView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct ScoreView: View {
    let score: Double
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Nota Final")
                .font(.headline)
            
            Text(String(format: "%.1f", score))
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.blue)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}

#Preview {
    ScoreView(score: 7.0)
}
