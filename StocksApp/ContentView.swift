//
//  ContentView.swift
//  StocksApp
//
//  Created by Andrei Avram on 08.02.2023.
//

import Combine
import SwiftUI

struct ContentView: View {
    @ObservedObject var searchViewModel = SearchViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
                switch searchViewModel.viewState {
                case let .success(data) :
                    List(data, id: \.self.symbol) { item in
                        ListCell(model: item)
                    }
                    case .initial :
                        Text("Search for something")
                    case .loading :
                        Text("Loading data")
                    case .error :
                        Text("Error")
                    }

        }.searchable(
            text: $searchText,
            prompt: "Search for symbol"
        ).onChange(of: searchText){ _ in
            searchViewModel.getSearchResult(query: searchText)
        }.onSubmit {
            searchViewModel.getSearchResult(query: searchText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell : View {
    var model: SearchSymbol

    var body: some View {
        NavigationLink  {
            StockView(stockSymbol: model.symbol)
        } label: {
            Text(model.symbol)
        }
    }
}
