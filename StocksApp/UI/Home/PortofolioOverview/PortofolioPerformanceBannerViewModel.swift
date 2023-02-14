//
//  PortofolioPerformanceBannerViewModel.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import Foundation
import Factory
import Combine

class PortofolioPerformanceViewModel : ObservableObject {
    @Injected(Container.currencyFormatter) private var currencyFormatter
    @Injected(Container.localStorage) private var localStorage
    @Injected(Container.portfolioRepository) private var portfolioRepo
    @Injected(Container.stockWatcher) private var stockWatcher

    private var cancellables = Set<AnyCancellable>()

    enum ViewState {
        case initial;
        case loading;
        case error;
        case success(data : PortofolioPerformanceOverviewModel)
    }

    @Published var viewState: ViewState = .initial

    func getPortofolioPerformance() {
        viewState = .loading
        stockWatcher.watchCollection(stockCollection: ["BINANCE:BTCUSDT"])
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("Finished")
                }
            }) { value in
                print(value)
            }.store(in: &cancellables)
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
