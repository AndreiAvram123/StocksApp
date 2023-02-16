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
    @Injected(Container.portfolioRepo) private var portfolioRepo
    @Injected(Container.financialItemsWatcher) private var financialItemsWatcher
    @Injected(Container.stockRepo) private var stockRepo

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
        financialItemsWatcher.connect()
        viewState = .loading
        portfolioRepo.fetchPortfolio()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error)
                    self.viewState = .error
                }
            } receiveValue: { portfolio in
                self.getPortfolioItemsQuote(portfolio: portfolio)
                self.chartViewState = .success(data: portfolio.performanceHistory)
            }.store(in: &cancellables)
    }

    private func getPortfolioItemsQuote(portfolio: PortfolioModel){
        let requests = portfolio.financialItems.map { item in
            stockRepo.fetchQuote(symbol: item.symbol)
        }
        Publishers.MergeMany(requests)
            .collect()
            .receive(on: DispatchQueue.main)
            .sink { completion in

            } receiveValue: { symbolsWithQuotes in
                var portfolioCurrentAmount = 0.0
                portfolio.financialItems.forEach { item in
                    let quote = symbolsWithQuotes.first { (symbol, quote) in
                        item.symbol == symbol
                    }?.1
                    if let quoteUnwrapped = quote {
                        portfolioCurrentAmount += quoteUnwrapped.currentPrice * item.quantityOwned
                    }
                }
                var portfolioInitialAmount = 0.0
                portfolio.financialItems.forEach { item in
                    portfolioInitialAmount += Double(item.purchasePrice)
                }
                self.viewState = .success(data: PortofolioPerformanceOverviewModel(
                    currentAmount: Int(portfolioCurrentAmount),
                    amountInvested: Int(portfolioInitialAmount)
                ))
            }.store(in: &cancellables)


    }


    private func subscribePriceUpdates(portfolio: PortfolioModel){
        financialItemsWatcher.subscribe(items: portfolio.financialItems) { update in
            self.viewState = .success(data: PortofolioPerformanceOverviewModel(currentAmount: Int(update.first!.currentPrice * 100), amountInvested: 1000) )
        }
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
