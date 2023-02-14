//
//  FinancialItemUpdateModel.swift
//  StocksApp
//
//  Created by Andrei Avram on 14.02.2023.
//

import Foundation

struct FinancialItemUpdate : Codable, Equatable {

    let symbol: String
    let currentPrice: Double

    private enum CodingKeys : String, CodingKey {
        case symbol = "s"
        case currentPrice = "p"
    }
}

extension FinancialItemUpdate {
    
    static func == (lhs: FinancialItemUpdate, rhs: FinancialItemUpdate) -> Bool {
        return lhs.symbol == rhs.symbol

    }
}
