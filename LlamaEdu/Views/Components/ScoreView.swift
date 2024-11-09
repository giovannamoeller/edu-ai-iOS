//
//  ScoreView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct ScoreView: View {
    let score: Int
    
    var percentage: String {
        return String(format: "%.1f%%", score * 10)
    }
    
    var finalScore: String {
        return String(format: "%.1f%", score)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Nota Final")
                .font(.largeTitle)
                .bold()
                .padding(.vertical)
            
            HStack {
                Text("Competência Total")
                Spacer()
                Text(percentage)
            }
            
            ProgressView(value: Double(score) * 10, total: 100.0)
                .padding(.vertical, 8)
                .scaleEffect(x: 1, y: 2, anchor: .center)
            
            HStack {
                Text("Nota Final")
                    .foregroundStyle(.secondary)
                Spacer()
                Text(finalScore)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ScoreView(score: 700)
}
