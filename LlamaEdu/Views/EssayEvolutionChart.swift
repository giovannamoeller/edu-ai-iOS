//
//  EssayEvolutionChart.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 10/11/24.
//

import SwiftUI
import Charts

struct EssayEvolutionChart: View {
    let essays: [Essay]
    
    private var chartData: [EssayChartData] {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        return essays
            .compactMap { essay -> EssayChartData? in
                guard let score = essay.totalScore,
                      let date = dateFormatter.date(from: essay.createdAt) else {
                    return nil
                }
                return EssayChartData(date: date, score: score)
            }
            .sorted { $0.date < $1.date }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text("Evolução das suas notas")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .center)
            
            Text("Verifique o gráfico abaixo.")
                .fontWeight(.thin)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 8)
            
            if chartData.isEmpty {
                Text("Sem dados suficientes para gerar o gráfico")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                Chart {
                    ForEach(chartData) { data in
                        LineMark(x: .value("Data", data.date, unit: .day),
                                 y: .value("Nota", data.score)
                        )
                        .interpolationMethod(.linear)
                        
                        PointMark(x: .value("Data", data.date, unit: .day),
                                  y: .value("Nota", data.score)
                        )
                        .foregroundStyle(Color.accentColor)
                    }
                }
                .chartXAxis {
                    AxisMarks(preset: .aligned) { value in
                        AxisGridLine()
                        AxisValueLabel(
                            format: .dateTime.day().month()
                        )
                    }
                }
                .chartYAxis {
                    AxisMarks(position: .leading) { value in
                        AxisGridLine()
                        AxisValueLabel {
                            if let intValue = value.as(Int.self) {
                                Text("\(intValue)")
                            }
                        }
                    }
                }
                .frame(height: 200)
            }
            
            // Add statistics
            if !chartData.isEmpty {
                VStack(spacing: 16.0) {
                    StatisticRow(
                        title: "Média",
                        value: averageScore,
                        icon: "chart.bar.fill"
                    )
                    StatisticRow(
                        title: "Maior nota",
                        value: highestScore,
                        icon: "arrow.up.circle.fill"
                    )
                    StatisticRow(
                        title: "Menor nota",
                        value: lowestScore,
                        icon: "arrow.down.circle.fill"
                    )
                }
                .padding()
            }
        }
        .padding()
        //.background(Color(.systemBackground))
        //.cornerRadius(12)
        //.shadow(color: .black.opacity(0.1), radius: 5)
    }
    
    private var averageScore: Int {
        guard !chartData.isEmpty else { return 0 }
        let sum = chartData.reduce(0) { $0 + $1.score }
        return sum / chartData.count
    }
    
    private var highestScore: Int {
        chartData.map(\.score).max() ?? 0
    }
    
    private var lowestScore: Int {
        chartData.map(\.score).min() ?? 0
    }
}

#Preview {
    EssayEvolutionChart(essays: [])
}
