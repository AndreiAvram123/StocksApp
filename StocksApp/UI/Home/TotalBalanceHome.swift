//
//  TotalBalanceHome.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import SwiftUI

struct TotalBalanceHome: View {
    var localStorage = LocalStorage()

    var body: some View {
        Text("Total balance \(localStorage.preferredCurrency.symbol)")
    }
}

struct TotalBalanceHome_Previews: PreviewProvider {
    static var previews: some View {
        TotalBalanceHome()
    }
}
