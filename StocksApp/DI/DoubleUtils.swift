//
//  DoubleUtils.swift
//  StocksApp
//
//  Created by Andrei Avram on 15.02.2023.
//

import Foundation

extension Double {
    func twoDecimalString() -> String {
        return String(format: "%.2f", self)
    }
}
