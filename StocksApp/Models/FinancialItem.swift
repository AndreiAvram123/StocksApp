//
//  Stock.swift
//  StocksApp
//
//  Created by Andrei Avram on 15.02.2023.
//

import Foundation

protocol FinancialItem : Codable {
    var symbol: String { get  set }
}


struct PlainFinancialItem : FinancialItem {
    var symbol: String
}
struct PortfolioFinancialItem : FinancialItem {
    var symbol: String
    let purchasePrice: Int
    let quantityOwned: Double
    
}
