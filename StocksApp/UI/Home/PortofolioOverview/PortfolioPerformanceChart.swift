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
                SuccessBody(historyEntries: PortofolioPerformanceViewModelMock.chartPreviewData)
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
            AxisMarks(values : .automatic(desiredCount: 5,
                                          roundLowerBound: true,
                                          roundUpperBound: true)) {
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
        }.frame(height: 150)
    }
}

struct ScreenPreview: PreviewProvider {
    static var successViewModel : PortofolioPerformanceViewModel {
        let viewModel = PortofolioPerformanceViewModel()
        viewModel.chartViewState = .success(data: PortofolioPerformanceViewModelMock.chartPreviewData)
        return viewModel
    }
    static var loadingViewModel : PortofolioPerformanceViewModel {
        let viewModel = PortofolioPerformanceViewModel()
        viewModel.chartViewState = .loading
        return viewModel
    }
    static var previews: some View {
        Group {
            PortfolioPerformanceChart(
                viewModel: successViewModel
            )
            PortfolioPerformanceChart(
                viewModel: loadingViewModel
            )
        }
    }
}
