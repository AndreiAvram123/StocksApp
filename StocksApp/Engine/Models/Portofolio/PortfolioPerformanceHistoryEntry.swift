//
//  PortfolioHistoryEntry.swift
//  StocksApp
//
//  Created by Andrei Avram on 14.02.2023.
//

import Foundation

struct PortfolioPerformanceHistoryEntry : Codable, Identifiable {

    let id = UUID()
    let datetime: Date
    let amount: Int

    private enum CodingKeys: String, CodingKey {
        case datetime, amount
    }
}
