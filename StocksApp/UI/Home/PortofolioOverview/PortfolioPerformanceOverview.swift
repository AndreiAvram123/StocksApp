//
//  TotalBalanceHome.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import SwiftUI
import Shimmer

struct PortfolioPerformanceOverview: View {
    var localStorage = LocalStorage()
    let currencyFormatter = CurrencyFormatterImpl()
    @ObservedObject var viewModel: PortofolioPerformanceViewModel = PortofolioPerformanceViewModel()

    var body: some View {
            HStack {
                switch viewModel.viewState {
                case let .success(data) :
                    VStack {
                        Text(R.string.localizable.homeScreenPortofolioPerformenceTotalBalance)
                            .font(UIStyles.BodyMedium.font)
                            .foregroundColor(UIStyles.BodyMedium.color)
                        Text(currencyFormatter.formatToUnit(amount: data.currentAmount, currency: Currency.defaultCurrency))
                    }
                    PortfolioOverviewPerformanceChange(
                        amount: 500 ,
                        percentage: 10,
                        negativePerformance: true,
                        viewModel: viewModel
                    )
                case .loading :
                    Text("$25,901.0.41")
                        .font(UIStyles.BodyMedium.font)
                        .redacted(reason: .placeholder)
                        .shimmering()
                default :
                    EmptyView()
                }
            }.onAppear {
                viewModel.getPortofolioPerformance()
            }
    }
}

struct TotalBalanceHome_Previews: PreviewProvider {
    static var  viewModelLoaded:  PortofolioPerformanceViewModel {
        let viewModel = PortofolioPerformanceViewModelMock()
        viewModel.mockViewState = .success(data: PortofolioPerformanceOverviewModel(currentAmount: 1000, amountInvested: 12000, procentageChange: 10))
        return viewModel
    }

    static var previews: some View {
        PortfolioPerformanceOverview(
            viewModel: viewModelLoaded
        )
    }
}
