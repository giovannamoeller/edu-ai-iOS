//
//  StatisticRow.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 10/11/24.
//

import SwiftUI

struct StatisticRow: View {
    let title: String
    let value: Int
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.accent)
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text("\(value)")
                .bold()
        }
    }
}

#Preview {
    StatisticRow(title: "Hello!", value: 5, icon: "")
}
