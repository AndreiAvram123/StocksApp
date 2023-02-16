//
//  PortofolioRepo.swift
//  StocksApp
//
//  Created by Andrei Avram on 13.02.2023.
//

import Foundation
import Combine
import Factory
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

protocol PortfolioRepo {
    func fetchPortfolio() -> AnyPublisher<PortfolioModel,Error>
}

class PortfolioRepoImpl : PortfolioRepo {
    @Injected(Container.networkManager) var networkManager: NetworkManager
    @Injected(Container.firestore) var firestore: Firestore
    @Injected(Container.decoder) var decoder: JSONDecoder


    func fetchPortfolio() -> AnyPublisher<PortfolioModel,Error> {
        let docRef = firestore.collection("users").document("w4boLEcRtJ1czyfbTiox").collection("data").document("portfolio")
        return docRef.getDocument().tryMap { document in
            if document.exists {
                return try document.data(as: PortfolioModel.self)
            } else {
                throw Errors.nilValue
            }
        }.eraseToAnyPublisher()
    }


}
