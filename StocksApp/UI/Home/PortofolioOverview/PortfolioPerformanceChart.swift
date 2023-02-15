//
//  PortfolioPerformanceChart.swift
//  StocksApp
//
//  Created by Andrei Avram on 14.02.2023.
//

import SwiftUI
import Charts
import Factory

struct PortfolioPerformanceChart: View {
    @ObservedObject var viewModel: PortofolioPerformanceViewModel


    var body: some View {
        VStack {
            switch viewModel.chartViewState {
            case .success(let data) :
                SuccessBody(historyEntries: data)
            case .loading :
                SuccessBody(historyEntries: ScreenPreview.mockData)
                    .redacted(reason: .placeholder)
                    .shimmering()
            default :
                EmptyView()
            }
        }

    }
}

private struct SuccessBody : View {
    var historyEntries: [PortfolioPerformanceHistoryEntry]
    let yMarkValues = stride(from: 0, to: 18000, by: 2000).map { $0 }
    var body : some View {

        Chart(historyEntries) { entry in
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
            AxisMarks(values: .automatic(roundLowerBound: true,
                                         roundUpperBound: true)) {
                AxisGridLine()
                AxisTick()
                AxisValueLabel(format: .dateTime.day())
            }
        }.frame(height: 250)
    }
}

struct ScreenPreview: PreviewProvider {
    static let today = Date()
   static var oneWeekIncrement: DateComponents {
        var comp = DateComponents()
        comp.day = 7
        return comp
    }

    static  var tomorrow: Date {
        return  Calendar.current.date(byAdding: oneWeekIncrement, to: today)!
    }

    static var mockData: [PortfolioPerformanceHistoryEntry] { [
        PortfolioPerformanceHistoryEntry(datetime: today,
                                         amount: 10000),
        PortfolioPerformanceHistoryEntry(datetime: tomorrow,
                                         amount: 14000)
    ]
    }
    static var successViewModel : PortofolioPerformanceViewModel {
        let viewModel = PortofolioPerformanceViewModel()
        viewModel.chartViewState = .success(data: mockData)
        return viewModel
    }
    static var previews: some View {
        PortfolioPerformanceChart(
            viewModel: successViewModel
        ).padding()
    }
}
