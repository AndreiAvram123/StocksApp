//
//  FinancialItemQuote.swift
//  StocksApp
//
//  Created by Andrei Avram on 15.02.2023.
//

import Foundation

struct FinancialItemQuote : Codable {
    let currentPrice: Double
    let change: Double
    let precentageChange: Double

    private enum CodingKeys : String, CodingKey {
        case currentPrice = "c"
        case change = "d"
        case precentageChange = "dp"
    }
}
