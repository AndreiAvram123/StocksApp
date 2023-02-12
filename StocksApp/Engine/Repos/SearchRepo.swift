//
//  SearchRepo.swift
//  StocksApp
//
//  Created by Andrei Avram on 08.02.2023.
//

import Foundation
import Combine

protocol SearchRepo {
    func searchByQuery(query: String) -> AnyPublisher<SearchSymbolResponse,Error>
}

class SearchRepoImpl : SearchRepo {
    
    func searchByQuery(query: String) -> AnyPublisher<SearchSymbolResponse,Error>{
        let networkManager = NetworkManager()
        let url = Constants.Search.searchSymbol(query: query)
         return networkManager.performRequest(requestURL: URL(string : url)!)
            .decode(type: SearchSymbolResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}
