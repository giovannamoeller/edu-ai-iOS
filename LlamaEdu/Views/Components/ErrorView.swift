//
//  ErrorView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import SwiftUI

struct ErrorView: View {
    let error: EssayCorrectionError
    let retry: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 50))
                .foregroundColor(.red)
            
            Text(error.title)
                .font(.headline)
            
            Text(error.message)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Button("Tentar Novamente", action: retry)
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ErrorView(error: .invalidImage, retry: {})
}
