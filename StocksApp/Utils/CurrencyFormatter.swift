//
//  CurrencyConverter.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import Foundation

protocol CurrencyFormatter {
    //100 pence -> 1 pound
    func formatToUnit(
        amount: Int,
        currency: Currency
    ) -> String
}

class CurrencyFormatterImpl : CurrencyFormatter {

    func formatToUnit(amount: Int, currency: Currency) -> String {
        let wholeAmountFormatted = addCommasToWholeAmount(amount: amount / 100)
        let decimalAmount = amount % 100
        let formattedAmount = "\(currency.symbol)\(wholeAmountFormatted).\(decimalAmount)"
        return formattedAmount
    }
    private func addCommasToWholeAmount(amount: Int) -> String {
        var amountWithCommas = String()
        let amountReversed = String(amount).reversed()
        for (index, char) in amountReversed.enumerated() {
            amountWithCommas.append(char)
            if index % 2 == 0 && index > 0 && index < amountReversed.count - 1 {
                amountWithCommas.append(",")
            }
        }
        return String(amountWithCommas.reversed())
    }
}

