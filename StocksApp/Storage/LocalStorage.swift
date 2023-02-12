//
//  LocalRepository.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import Foundation

class LocalStorage {

    let userDefault: UserDefaults

    init() {
        userDefault = UserDefaults.standard
    }

    private let preferredCurrencyKey = "preferredCurrency"
    var preferredCurrency: Currency {
        get {
            guard let isoCode = userDefault.string(forKey: preferredCurrencyKey) else {
                return Currency.defaultCurrency
            }
            return Currency(isoCode: isoCode)
        }
        set {
            userDefault.set(newValue.isoCode, forKey: preferredCurrencyKey)
        }
    }


}
