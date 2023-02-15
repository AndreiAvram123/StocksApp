//
//  FinancialItemsRepo.swift
//  StocksApp
//
//  Created by Andrei Avram on 08.02.2023.
//

import Combine
import Foundation

protocol CompanyRepo {
    func fetchCompanyProfileBySymbol(symbol: String) -> AnyPublisher<CompanyProfile, Error>
}

class CompanyRepoImpl : CompanyRepo {

    func fetchCompanyProfileBySymbol(symbol: String) -> AnyPublisher<CompanyProfile, Error> {
        let networkManager = NetworkManager()
        print(Constants.FinancialItems.Stocks.companyProfileBySymbol(symbol: symbol))
        let url = URL(string: Constants.FinancialItems.Stocks.companyProfileBySymbol(symbol: symbol))!
        return networkManager.performRequest(requestURL: url)
            .decode(type: CompanyProfile.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
