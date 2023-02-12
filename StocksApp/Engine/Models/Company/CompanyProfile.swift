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
}
