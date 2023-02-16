//
//  StockQuote.swift
//  StocksApp
//
//  Created by Andrei Avram on 15.02.2023.
//

import Foundation

struct StockQuote : Codable {
    let currentPrice: Double
    let change: Double
    let precentageChange: Double
    let openPrice: Double

    private enum CodingKeys : String, CodingKey {
        case currentPrice = "c"
        case change = "d"
        case precentageChange = "dp"
        case openPrice  = "o"
    }

    static let mockInstance: StockQuote = StockQuote(
        currentPrice: 150,
        change: 20,
        precentageChange: 5,
        openPrice: 100
    )
}
