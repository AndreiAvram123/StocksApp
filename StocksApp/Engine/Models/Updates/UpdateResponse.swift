//
//  UpdateResponse.swift
//  StocksApp
//
//  Created by Andrei Avram on 14.02.2023.
//

import Foundation

struct FinancialItemsUpdateDTO : Codable {
    let data: [FinancialWSUpdate]
    let type: String
}
