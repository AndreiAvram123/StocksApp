//
//  StockWatcher.swift
//  StocksApp
//
//  Created by Andrei Avram on 14.02.2023.
//

import Foundation
import Combine
import Factory
import Starscream

class StockWatcher {
    private let url = "wss://ws.finnhub.io?token=cfhtr4hr01qq9nt1lbb0cfhtr4hr01qq9nt1lbbg"
    private var sockets: [WebSocket] = []
    @Injected (Container.encoder) var encoder: JSONEncoder

    func watchCollection(stockCollection: [String]) -> AnyPublisher<String, Error>  {
        let subject = PassthroughSubject<String, Error>()
        let request = URLRequest(url: URL(string : url)!)
        let socket = WebSocket(request: request)
        sockets.append(socket)
        socket.onEvent = { event in
            switch event {
            case .connected(_) :
                stockCollection.forEach { stockSymbol in
                    let message =  WsSubscribeMessage(symbol: stockSymbol)
                    do {
                        if let jsonData: String = String(data: try self.encoder.encode(message), encoding: .utf8) {
                            socket.write(string: jsonData)
                        }
                    } catch {

                    }
                }
            case .disconnected(_, _):
                subject.send(completion: .failure(WSErrors.disconnected))
            case .text(let string):
                subject.send(string)
            case .cancelled:
                subject.send(completion: .failure(WSErrors.cancelled))
            case .error(let error):
                subject.send(completion: .failure(WSErrors.errorWrapper(error: error)))
            default:
                break

            }
        }
        socket.connect()
        return subject.eraseToAnyPublisher()
    }


    enum WSErrors : Error {
        case disconnected
        case cancelled
        case errorWrapper(error: Error?)
    }
    struct WsSubscribeMessage : Codable{
        var type: String = "subscribe"
        let symbol: String
    }
}
