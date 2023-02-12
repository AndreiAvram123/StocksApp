//
//  UtilsContainer.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import Foundation
import Factory

extension Container {
    static let currencyFormatter = Factory<CurrencyFormatter> {
        CurrencyFormatterImpl()
    }
    static let localStorage = Factory<LocalStorage> {
        LocalStorage()
    }
}
