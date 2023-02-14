//
//  Portfolio.swift
//  StocksApp
//
//  Created by Andrei Avram on 13.02.2023.
//

import Foundation

struct PortfolioModel : Codable {
    var stocks: [String]
    var performanceHistory: [PortfolioPerformanceHistoryEntry]
}
