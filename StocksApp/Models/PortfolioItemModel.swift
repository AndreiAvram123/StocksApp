//
//  HomePortfolioItem.swift
//  StocksApp
//
//  Created by Andrei Avram on 16.02.2023.
//

import Foundation

struct PortfolioItemModel {
    let companyProfile: CompanyProfile
    let quote: StockQuote
    var priceUpdate: ItemPriceUpdate? = nil

    var isNegativeChange: Bool {
        if let update = priceUpdate {
            return update.currentPrice < quote.previousClosePrice
        } else {
            return quote.currentPrice < quote.previousClosePrice
        }
    }

    var change: Double {
        if let update = priceUpdate {
            return abs(update.currentPrice - quote.previousClosePrice)
        } else {
            return abs(quote.change)
        }
    }
    var currentPrice: Double {
        if let update = priceUpdate {
            return update.currentPrice
        } else {
            return quote.currentPrice
        }
    }

    static let mockInstance = PortfolioItemModel(
        companyProfile: CompanyProfile.mockInstance(),
        quote: StockQuote.mockInstance
    )
}
