//
//  HomePortfolioItemChange.swift
//  StocksApp
//
//  Created by Andrei Avram on 15.02.2023.
//

import SwiftUI

struct HomePortfolioItemChange: View {
    var amountChange: Double
    var procentageChange: Double
    var isNegativeChange: Bool


    var body: some View {
        if isNegativeChange {
            Text("↓ -\(amountChange.twoDecimalString()) (\(String(procentageChange.twoDecimalString()))%)")
                .padding(UIStyles.Dimens.spaceSmall)
                .foregroundColor(Color(R.color.lavaRed))
                .background(Color(R.color.pearl))
                .clipShape(Capsule())
        } else {
            Text("↑ \(amountChange.twoDecimalString()) (\(procentageChange.twoDecimalString())%)")
                .padding(UIStyles.Dimens.spaceSmall)
                .foregroundColor(Color(R.color.forestgreen))
                .background(Color(R.color.pearl))
                .clipShape(Capsule())
        }
    }
}

struct HomePortfolioItemChange_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomePortfolioItemChange(
                amountChange: 1000, procentageChange: 10 ,isNegativeChange: false
            )
            HomePortfolioItemChange(
                amountChange: 1000, procentageChange: 10, isNegativeChange: true
            )
        }
    }
}
