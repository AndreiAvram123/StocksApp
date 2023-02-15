//
//  CompanyProfile.swift
//  StocksApp
//
//  Created by Andrei Avram on 08.02.2023.
//

import Foundation

struct CompanyProfile: Codable {
    let country, currency, exchange, ipo: String
    let marketCapitalization: Double
    let name, phone: String
    let shareOutstanding: Double
    let ticker: String
    let weburl: String
    let logo: String
    let finnhubIndustry: String

    static func mockInstance() -> CompanyProfile {
        return CompanyProfile(country:"US", currency: "USD", exchange: "NASDAQ NMS - GLOBAL MARKET", ipo: "1980-12-12", marketCapitalization: 2423922.1231999993, name: "Apple Inc", phone: "14089961010.0", shareOutstanding: 15821.9, ticker: "AAPL", weburl: "AAPL", logo: "https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AAPL.svg", finnhubIndustry: "Technology")
    }
}
