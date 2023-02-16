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
    let previousClosePrice: Double

    private enum CodingKeys : String, CodingKey {
        case currentPrice = "c"
        case change = "d"
        case precentageChange = "dp"
        case openPrice  = "o"
        case previousClosePrice = "pc"
    }

    static let mockInstance: StockQuote = StockQuote(
        currentPrice: 150,
        change: 20,
        precentageChange: 5,
        openPrice: 100,
        previousClosePrice: 100
    )
}
