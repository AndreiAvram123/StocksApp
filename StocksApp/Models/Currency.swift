//
//  Currency.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import Foundation

struct Currency{
    let symbol: String
    let isoCode: String

    init(isoCode: String) {
        self.isoCode = isoCode
        let locale = NSLocale(localeIdentifier: isoCode)
        guard let unwrappedSymbol = locale.displayName(forKey: .currencySymbol, value: isoCode) else {
            self.symbol = Currency.self.defaultCurrency.symbol
            return
        }
        self.symbol = unwrappedSymbol
    }
    static let defaultCurrency = Currency(isoCode: "GBP")
}
