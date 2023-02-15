//
//  NetworkContainer.swift
//  StocksApp
//
//  Created by Andrei Avram on 13.02.2023.
//

import Foundation
import Factory
import FirebaseFirestore


extension Container {
    static let networkManager = Factory<NetworkManager> {
        NetworkManager()
    }
    static let stockWatcher = Factory<FinancialItemsWatcher> {
        FinancialItemsWatcher()
    }

    static let portfolioRepository = Factory<PortfolioRepo> {
        PortfolioRepoImpl()
    }

    static let companyRepo = Factory<CompanyRepo> {
        CompanyRepoImpl()
    }

    static let firestore = Factory<Firestore> {
        Firestore.firestore()
    }

}
