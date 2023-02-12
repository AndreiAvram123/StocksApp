//
//  PortofolioPerformanceBannerViewModel.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import Foundation
import Factory

class PortofolioPerformanceViewModel : ObservableObject {
    @Injected(Container.currencyFormatter) private var currencyFormatter
    @Injected(Container.localStorage) private var localStorage


    enum ViewState {
        case initial;
        case loading;
        case error;
        case success(data : PortofolioPerformanceOverviewModel)
    }

    @Published var viewState: ViewState = .initial

    func getPortofolioPerformance() {
        viewState = .loading 
    }
    func formatToUnit(amount: Int) -> String {
        return currencyFormatter.formatToUnit(amount: amount,
                                              currency: localStorage.preferredCurrency)
    }
}
class PortofolioPerformanceViewModelMock : PortofolioPerformanceViewModel {
    var mockViewState: ViewState = .initial

    override func getPortofolioPerformance() {
        viewState = mockViewState
    }
}
