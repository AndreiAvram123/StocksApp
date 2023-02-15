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

    enum AmountViewState {
        case initial;
        case loading;
        case error;
        case success(data : PortofolioPerformanceOverviewModel)
    }

    enum ChartViewState {
        case initial;
        case loading;
        case error;
        case success(data : [PortfolioPerformanceHistoryEntry])
    }

    @Published var viewState: AmountViewState = .initial
    @Published var chartViewState: ChartViewState = .initial

    func getPortofolioPerformance() {
        viewState = .loading
        portfolioRepo.fetchPortfolio()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error)
                    self.viewState = .error
                }
            } receiveValue: { portfolio in
                self.chartViewState = .success(data: portfolio.performanceHistory)
                self.watchPortfolio(portfolio: portfolio)
            }.store(in: &cancellables)
    }
    private func watchPortfolio(portfolio: PortfolioModel){
        stockWatcher.watchCollection(financialItems: portfolio.stocks)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("Finished")
                }
            }) { data in
                self.viewState = .success(data: PortofolioPerformanceOverviewModel(currentAmount: Int(data.first!.currentPrice * 100), amountInvested: 1000) )
            }.store(in: &cancellables)
    }

    func formatToUnit(amount: Int) -> String {
        return currencyFormatter.formatToUnit(amount: amount,
                                              currency: localStorage.preferredCurrency)
    }
}
class PortofolioPerformanceViewModelMock : PortofolioPerformanceViewModel {
    var mockViewState: AmountViewState = .initial

    override func getPortofolioPerformance() {
        viewState = mockViewState
    }


    private static var today = Date()

    private static var oneDayIncrement: DateComponents {
        var comp = DateComponents()
        comp.day = 1
        return comp
    }
    private static var twoDayIncrement: DateComponents {
        var comp = DateComponents()
        comp.day = 2
        return comp
    }


    private static var tomorrow: Date {
        return Calendar.current.date(byAdding: oneDayIncrement, to: today)!
    }

    static var chartPreviewData: [PortfolioPerformanceHistoryEntry] { [
        PortfolioPerformanceHistoryEntry(datetime: Calendar.current.date(byAdding: oneDayIncrement, to: today)!,
                                         amount: 10000),
        PortfolioPerformanceHistoryEntry(datetime: Calendar.current.date(byAdding: twoDayIncrement, to: today)!,
                                         amount: 14000)
    ]
    }
}
