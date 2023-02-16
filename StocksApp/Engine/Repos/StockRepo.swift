//
//  StockRepo.swift
//  StocksApp
//
//  Created by Andrei Avram on 16.02.2023.
//

import Foundation
import Combine
import Factory

protocol StockRepo {
    func fetchQuote(symbol: String) -> AnyPublisher<(String, StockQuote), Error>
}

class StockRepoImpl : StockRepo {
    @Injected(Container.networkManager) var networkManager: NetworkManager
    @Injected(Container.decoder) var decoder: JSONDecoder

    func fetchQuote(symbol: String) -> AnyPublisher<(String, StockQuote), Error> {
        let url = URL(string : APIUrls.FinancialItems.Stocks.quote(symbol: symbol))!
        return networkManager.performRequest(requestURL: url)
            .decode(type: StockQuote.self, decoder: decoder)
            .map { quote in
                (symbol, quote)
            }
            .eraseToAnyPublisher()
    }

}
