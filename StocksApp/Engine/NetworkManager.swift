//
//  NetworkManager.swift
//  StocksApp
//
//  Created by Andrei Avram on 08.02.2023.
//

import Combine
import Foundation

class NetworkManager {

    private let session: URLSession = URLSession.shared

    func performRequest( requestURL: URL) -> AnyPublisher<Data, Error> {
        session.dataTaskPublisher(for: requestURL)
            .tryMap({ (data: Data, response: URLResponse) in
              
                return data
            })
            .eraseToAnyPublisher()
    }
}

enum RequestState<T> {
    case Success(data: T)
    case Loading
    case Failed(code: Int?, message: String?)

    var isSuccess: Bool {
        switch self {
        case .Success(data: _):
            return true
        case .Loading:
            return false
        case .Failed(code: _, message: _):
            return false
        }
    }
}

