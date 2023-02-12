//
//  Constants.swift
//  StocksApp
//
//  Created by Andrei Avram on 08.02.2023.
//

import Foundation

struct Constants {
    static let baseUrl = "https://finnhub.io/api/v1"
    struct Search {
        static func searchSymbol(query: String) -> String {
            return "\(Constants.baseUrl)/search?q=\(query)&token=cfhtr4hr01qq9nt1lbb0cfhtr4hr01qq9nt1lbbg"
        }
    }
    struct FinancialItems {
        struct Stocks {
            static func companyProfileBySymbol(symbol: String) -> String {
                return "\(Constants.baseUrl)/stock/profile2?symbol=\(symbol)&token=cfhtr4hr01qq9nt1lbb0cfhtr4hr01qq9nt1lbbg"
            }
        }
    }
}
