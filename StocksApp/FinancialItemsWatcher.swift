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

class FinancialItemsWatcher {
    private let url = "wss://ws.finnhub.io?token=cfhtr4hr01qq9nt1lbb0cfhtr4hr01qq9nt1lbbg"
    private var sockets: [WebSocket] = []
    @Injected(Container.encoder) var encoder: JSONEncoder
    @Injected(Container.decoder) var decoder: JSONDecoder
    private var lastUpdateTime: Date? = nil

    func watchCollection(financialItems: [FinancialItem]) -> AnyPublisher<[ItemPriceUpdate], Error>  {
        let subject = PassthroughSubject<[ItemPriceUpdate], Error>()
        let request = URLRequest(url: URL(string : url)!)
        let socket = WebSocket(request: request)
        sockets.append(socket)
        socket.onEvent = { event in
            switch event {
            case .connected(_) :
                financialItems.forEach { item in
                    let message =  WsSubscribeMessage(symbol: item.symbol)
                    do {
                        if let jsonData: String = String(data: try self.encoder.encode(message), encoding: .utf8) {
                            socket.write(string: jsonData)
                        }
                    } catch {
                        print(error)
                    }
                }
            case .disconnected(_, _):
                subject.send(completion: .failure(WSErrors.disconnected))
            case .text(let string):
                do {
                    let rawUpdate = try self.decoder.decode(FinancialItemsUpdateDTO.self, from: Data(string.utf8))
                    var update: [ItemPriceUpdate] = [ItemPriceUpdate]()
                    rawUpdate.data.forEach { financialItem in
                        if !update.contains(financialItem) {
                            update.append(financialItem)
                        }
                    }
                    if let lastUpdateTimeUnwrapped = self.lastUpdateTime {
                        let secondsSinceLastUpdate = Calendar.current.dateComponents([.second], from: lastUpdateTimeUnwrapped,to: Date()).second!
                        if secondsSinceLastUpdate > 1 {
                            subject.send(update)
                            self.lastUpdateTime = Date()
                        }
                    } else {
                        self.lastUpdateTime = Date()
                    }
                } catch {
                    print(error)
                }
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
