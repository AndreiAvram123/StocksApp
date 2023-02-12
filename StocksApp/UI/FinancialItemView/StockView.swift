//
//  DetailedSymbol.swift
//  StocksApp
//
//  Created by Andrei Avram on 08.02.2023.
//

import SwiftUI
import Combine

struct StockView: View {
    let stockSymbol: String
    @ObservedObject var viewModel: StockViewViewModel = StockViewViewModel()

    var body: some View {
        VStack {
            switch viewModel.viewState {
            case let .success(companyProfile):
                Text(companyProfile.logo)
            default : Text("sdfs")
            }
        }.onAppear {
            viewModel.getCompanyProfileBySymbol(symbol: stockSymbol)
        }
    }
}

struct DetailedSymbol_Previews: PreviewProvider {
    static var previews: some View {
        StockView(stockSymbol: "")
    }
}
