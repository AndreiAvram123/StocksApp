//
//  FinancialItemUpdateModel.swift
//  StocksApp
//
//  Created by Andrei Avram on 14.02.2023.
//

import Foundation

struct ItemPriceUpdate : Codable, Equatable {

    let symbol: String
    let currentPrice: Double

    private enum CodingKeys : String, CodingKey {
        case symbol = "s"
        case currentPrice = "p"
    }
}

extension ItemPriceUpdate {
    
    static func == (lhs: ItemPriceUpdate, rhs: ItemPriceUpdate) -> Bool {
        return lhs.symbol == rhs.symbol

    }
}
