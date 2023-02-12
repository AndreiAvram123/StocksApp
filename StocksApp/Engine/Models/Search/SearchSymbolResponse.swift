//
//  SearchSymbolResponse.swift
//  StocksApp
//
//  Created by Andrei Avram on 08.02.2023.
//

import Foundation

struct SearchSymbolResponse : Codable {
    let count: Int
    let result: [SearchSymbol]
}
