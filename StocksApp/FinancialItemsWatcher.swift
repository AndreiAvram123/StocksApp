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
    @Injected(Container.encoder) var encoder: JSONEncoder
    @Injected(Container.decoder) var decoder: JSONDecoder
    private var lastUpdateTime: Date? = nil
    private var itemsWithCallbacks:[( [FinancialItem] , ([ItemPriceUpdate])-> Void)] = []
    private var socket: WebSocket? = nil
    private var currentWatchedItems: [FinancialItem] = []
    private var isConnected: Bool = false

   
    func subscribe(items: [FinancialItem], callback: @escaping (([ItemPriceUpdate]) -> Void)) {
        addItemsToWatch(items: items)
        itemsWithCallbacks.append((items,callback))
    }
    private func addItemsToWatch(items:[FinancialItem]) {
        items.forEach { item in
            if !currentWatchedItems.contains(where: { currentWatchedItem in
                currentWatchedItem.symbol == item.symbol
            }){
                currentWatchedItems.append(item)
                sendSubscribeFinancialItemMessage(financialItem: item)
            }
        }
    }


    private func sendSubscribeFinancialItemMessage(financialItem: FinancialItem){
        let message =  WsSubscribeMessage(symbol: financialItem.symbol)
        do {
            if let jsonData: String = String(data: try self.encoder.encode(message), encoding: .utf8) {
                socket?.write(string: jsonData)
            }
        } catch {
            print(error)
        }
    }

     func connect(){
        let request = URLRequest(url: URL(string : url)!)
        if socket == nil {
            socket = WebSocket(request: request)
        }
        socket = WebSocket(request: request)
        socket?.onEvent = { event in
            switch event {
            case .connected(_) :
                print("connected")
            case .disconnected(_, _):
                print("disconnected")
            case .text(let string):
                self.handleResponse(responseString: string)
            case .cancelled:
                print("cancelled")
            case .error(let error):
                print(error)
            default:
                break
            }
        }
        socket?.connect()
    }
    private func handleResponse(responseString : String){
        do {
            let rawUpdate = try self.decoder.decode(FinancialItemsUpdateDTO.self, from: Data(responseString.utf8))
            var update: [ItemPriceUpdate] = [ItemPriceUpdate]()
            rawUpdate.data.forEach { financialItem in
                if !update.contains(financialItem) {
                    update.append(financialItem)
                }
            }

            if let lastUpdateTimeUnwrapped = self.lastUpdateTime {
                let secondsSinceLastUpdate = Calendar.current.dateComponents([.second], from: lastUpdateTimeUnwrapped,to: Date()).second!
                if secondsSinceLastUpdate > 1 {
                    itemsWithCallbacks.forEach { itemsWithCallback in
                        //prepare update for each callback
                        let specificCallbackUpdate = update.filter { itemPriceUpdate in
                            itemsWithCallback.0.contains { financialItem in
                                financialItem.symbol == itemPriceUpdate.symbol
                            }
                        }
                        itemsWithCallback.1(specificCallbackUpdate)
                    }
                    self.lastUpdateTime = Date()
                }
            } else {
                self.lastUpdateTime = Date()
            }
        } catch {
            print(error)
        }
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
