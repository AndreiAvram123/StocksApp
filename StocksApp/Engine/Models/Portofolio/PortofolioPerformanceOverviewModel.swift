//
//  PortofolioPerformanceOverview.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import Foundation

struct PortofolioPerformanceOverviewModel : Codable{
    let currentAmount: Int
    let amountInvested: Int
    private var _procentageChange: Double {
        let percentageChangeWithDecimals = ((Double(currentAmount) / Double(amountInvested)) -  1) * 100
        return (percentageChangeWithDecimals * 100).rounded() / 100
    }
    var procentageChangeString: String {
        return String(format: "%.2f", _procentageChange)
    }
    var amountChange: Int {
        return abs(currentAmount - amountInvested)
    }
    var isNegativePerformance: Bool {
        return currentAmount < amountInvested
    }
}
