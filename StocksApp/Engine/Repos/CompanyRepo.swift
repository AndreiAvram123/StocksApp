//
//  FinancialItemsRepo.swift
//  StocksApp
//
//  Created by Andrei Avram on 08.02.2023.
//

import Combine
import Foundation
import Factory

protocol CompanyRepo {
    func fetchCompanyProfileBySymbol(symbol: String) -> AnyPublisher<CompanyProfile, Error>
}

class CompanyRepoImpl : CompanyRepo {

    @Injected(Container.decoder) var decoder: JSONDecoder

    func fetchCompanyProfileBySymbol(symbol: String) -> AnyPublisher<CompanyProfile, Error> {
        let networkManager = NetworkManager()
        print(APIUrls.FinancialItems.Stocks.companyProfileBySymbol(symbol: symbol))
        let url = URL(string: APIUrls.FinancialItems.Stocks.companyProfileBySymbol(symbol: symbol))!
        return networkManager.performRequest(requestURL: url)
            .decode(type: CompanyProfile.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
