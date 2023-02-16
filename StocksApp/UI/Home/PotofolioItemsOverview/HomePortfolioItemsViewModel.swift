//
//  HomePortofolioItemsViewModel.swift
//  StocksApp
//
//  Created by Andrei Avram on 15.02.2023.
//

import Foundation
import Factory
import Combine
import OSLog

class HomePortfolioItemsViewModel : ObservableObject {
    @Injected(Container.portfolioRepo) var portofolioRepo: PortfolioRepo
    @Injected(Container.companyRepo) var companyRepo: CompanyRepo
    @Injected(Container.stockRepo) var stockRepo: StockRepo
    @Injected(Container.logger) var logger: Logger
    @Injected(Container.financialItemsWatcher) var itemsWatcher: FinancialItemsWatcher

    enum ViewState {
        case initial
        case loading
        case success(data: [PortfolioItemModel])
        case error
    }

    class SuccessDataWrapper : ObservableObject {
        @Published var data: [PortfolioItemModel]

        init(data: [PortfolioItemModel]) {
            self.data = data
        }
    }

    private var cancellables = Set<AnyCancellable>()
    @Published var viewState: ViewState = .initial


    func getPortfolioItems() {
        viewState = .loading
        portofolioRepo
            .fetchPortfolio()
            .receive(on: DispatchQueue.main)
            .sink {  completion in
                print(completion)
            } receiveValue: { portofolioModel in
                //todo
                //modify to Stock class
                self.getPortfolioItemsData(portfolioModel: portofolioModel)

            }.store(in: &cancellables)

    }

    //todo
    //put in repo
    private func getPortfolioItemsData(portfolioModel : PortfolioModel){
        let companyProfilePublishers = portfolioModel.financialItems.map { item in
            companyRepo.fetchCompanyProfileBySymbol(symbol: item.symbol)
        }
        let companyProfileMergePublisher = Publishers.MergeMany(companyProfilePublishers)
            .collect()

        let itemsQuotePublishers = portfolioModel.financialItems.map { item in
            stockRepo.fetchQuote(symbol: item.symbol)
        }
        let itemsQuoteMergePublisher = Publishers.MergeMany(itemsQuotePublishers)
            .collect()

        Publishers.Zip(
            companyProfileMergePublisher,
            itemsQuoteMergePublisher)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure = completion {
                    self.viewState = .error
                }
            } receiveValue: { companiesProfile, itemsSymbolWithQuote in

                let portfolioItems: [PortfolioItemModel] = companiesProfile.compactMap { companyProfile in
                        //try to find the company with the given quote
                        guard let symbolWithQuote = itemsSymbolWithQuote.first(where: { symbolWithQuote in
                            symbolWithQuote.0 == companyProfile.ticker
                        }) else {
                            return nil
                        }
                    return PortfolioItemModel(companyProfile: companyProfile , quote: symbolWithQuote.1)
                }
                self.viewState = .success(data: portfolioItems)
                self.watchPortfolioItems(portfolioItems: portfolioItems)
            }.store(in: &cancellables)
    }

    private func watchPortfolioItems(portfolioItems : [PortfolioItemModel]) {
        let itemsToWatch = portfolioItems.map { PlainFinancialItem(
            symbol : $0.companyProfile.ticker)
        }
        itemsWatcher.subscribe(items: itemsToWatch) { update in
            if case .success(let currentData) = self.viewState {
                let newData = currentData.map { oldItem in
                    PortfolioItemModel(
                        companyProfile: oldItem.companyProfile,
                        quote: oldItem.quote,
                        priceUpdate: update.first(where: { priceUpdate in
                            priceUpdate.symbol == oldItem.companyProfile.ticker
                        })
                    )
                }
                self.viewState = .success(data: newData)
                print(newData)
            }
        }
    }
}
class HomePortfolioItemsViewModelMock : HomePortfolioItemsViewModel {
    var mockState: ViewState = .initial
    override func getPortfolioItems() {
        viewState = mockState
    }
}

