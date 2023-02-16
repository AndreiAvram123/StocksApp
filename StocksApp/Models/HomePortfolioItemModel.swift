//
//  HomePortfolioItem.swift
//  StocksApp
//
//  Created by Andrei Avram on 16.02.2023.
//

import Foundation

struct HomePortfolioItemModel {
    let companyProfile: CompanyProfile
    let quote: StockQuote
    var priceUpdate: ItemPriceUpdate? = nil

    var change: Double {
        if let update = priceUpdate {
            return abs(update.currentPrice - quote.openPrice)
        } else {
            return quote.currentPrice
        }
    }
    static let mockInstance = HomePortfolioItemModel(
        companyProfile: CompanyProfile.mockInstance(),
        quote: StockQuote.mockInstance
    )
}
