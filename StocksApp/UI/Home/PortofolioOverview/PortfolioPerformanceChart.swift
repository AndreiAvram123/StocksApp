//
//  PortfolioPerformanceChart.swift
//  StocksApp
//
//  Created by Andrei Avram on 14.02.2023.
//

import SwiftUI
import Charts

struct PortfolioPerformanceChart: View {
    let today = Date()
    var oneWeekIncrement: DateComponents {
        var comp = DateComponents()
        comp.day = 7
        return comp
    }

    var tomorrow: Date {
        return  Calendar.current.date(byAdding: oneWeekIncrement, to: today)!
    }



    var mockData: [PortfolioPerformanceHistoryEntry] { [
        PortfolioPerformanceHistoryEntry(datetime: today,
                                         amount: 10000),
        PortfolioPerformanceHistoryEntry(datetime: tomorrow,
                                         amount: 14000)
    ]
    }
    let yMarkValues = stride(from: 0, to: 18000, by: 2000).map { $0 }
    

    var body: some View {
        Chart(mockData) { entry in
            LineMark(
                x: .value("Date", entry.datetime),
                y : .value("Amount", entry.amount)
            ).foregroundStyle(.orange)

            PointMark(
                x: .value("Date", entry.datetime),
                y : .value("Amount", entry.amount)
            ).foregroundStyle(.orange)
            .interpolationMethod(.catmullRom)

        }.chartYAxis {
            AxisMarks(values : yMarkValues) {
                AxisGridLine()
                AxisTick()
                AxisValueLabel()
            }
        }.chartXAxis {
            AxisMarks(values : .automatic(desiredCount: 7)) {
                AxisGridLine()
                AxisTick()
                AxisValueLabel(format: .dateTime.day())
            }
        }.frame(height: 250)

    }
}

struct PortfolioPerformanceChart_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioPerformanceChart().padding()
    }
}
