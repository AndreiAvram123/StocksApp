//
//  TotalBalanceHome.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import SwiftUI
import Shimmer
import Charts


struct PortfolioPerformanceOverview: View {
    var localStorage = LocalStorage()
    let currencyFormatter = CurrencyFormatterImpl()
    @ObservedObject var viewModel: PortofolioPerformanceViewModel

    var body: some View {
        VStack (alignment: .leading) {
                switch viewModel.viewState {
                case let .success(data) :
                    SuccessBody(data: data, viewModel: viewModel)
                case .loading :
                    SuccessBody(data : PortfolioPerformanceOverviewPreview.mockData,viewModel: viewModel).redacted(reason: .placeholder).shimmering()
                default :
                    EmptyView()
                }
            }.onAppear {
                viewModel.getPortofolioPerformance()
            }
    }
}

private struct SuccessBody: View {
    var data: PortofolioPerformanceOverviewModel
    var viewModel: PortofolioPerformanceViewModel
   

    var body: some View {
            Text(R.string.localizable.homeScreenPortofolioPerformenceTotalBalance)
                .font(UIStyles.BodyMedium.font)
                .foregroundColor(UIStyles.BodyMedium.color)

            HStack {
                Text(viewModel.formatToUnit(amount: data.currentAmount))

                PortfolioOverviewPerformanceChange(
                    data: data,
                    viewModel: viewModel
                )
        }
    }
}

struct PortfolioPerformanceOverviewPreview: PreviewProvider {
    static var mockData = PortofolioPerformanceOverviewModel(currentAmount: 10000, amountInvested: 12000)

    static var  viewModelLoaded:  PortofolioPerformanceViewModel {
        let viewModel = PortofolioPerformanceViewModelMock()
        viewModel.mockViewState = .success(data: mockData)
        return viewModel
    }
    static var viewModelLoading: PortofolioPerformanceViewModel {
        let viewModel = PortofolioPerformanceViewModelMock()
        viewModel.mockViewState = .loading
        return viewModel
    }

    static var previews: some View {
        Group {
            PortfolioPerformanceOverview(
                viewModel: viewModelLoaded
            )
            PortfolioPerformanceOverview(
                viewModel: viewModelLoading
            )
        }

    }
}
