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
    @Injected(Container.portfolioRepository) var portofolioRepo: PortfolioRepo
    @Injected(Container.companyRepo) var companyRepo: CompanyRepo
    @Injected(Container.logger) var logger: Logger

    enum ViewState {
        case initial
        case loading
        case success(data: [CompanyProfile])
        case error
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

    private func getPortfolioItemsData(portfolioModel : PortfolioModel){
        let companyProfilePublishers = portfolioModel.financialItems.map { item in
            companyRepo.fetchCompanyProfileBySymbol(symbol: item.symbol)
        }
        Publishers.MergeMany(companyProfilePublishers)
            .collect()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { output in
                self.viewState = .success(data: output)
            }.store(in: &cancellables)


    }
}
class HomePortfolioItemsViewModelMock : HomePortfolioItemsViewModel {
    var mockState: ViewState = .initial
    override func getPortfolioItems() {
        viewState = mockState
    }
}

