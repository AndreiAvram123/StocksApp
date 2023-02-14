//
//  PortofolioChange.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import SwiftUI

struct PortfolioOverviewPerformanceChange: View {
    var data: PortofolioPerformanceOverviewModel
    var viewModel: PortofolioPerformanceViewModel
    var formattedAmountChange: String {
        return viewModel.formatToUnit(amount: data.amountChange)
    }
    var body: some View {
        if data.isNegativePerformance {
            Text("↓ -\(formattedAmountChange) (\(data.procentageChangeString)%)")
                .padding(UIStyles.Dimens.spaceSmall)
                .foregroundColor(Color(R.color.lavaRed))
                .background(Color(R.color.pearl))
                .clipShape(Capsule())
        } else {
            Text("↑ \(formattedAmountChange) (\(data.procentageChangeString)%)")
                .padding(UIStyles.Dimens.spaceSmall)
                .foregroundColor(Color(R.color.forestgreen))
                .background(Color(R.color.pearl))
                .clipShape(Capsule())
        }
    }
}

struct PortofolioChange_Previews: PreviewProvider {
    static var mockData = PortofolioPerformanceOverviewModel(currentAmount: 1000, amountInvested: 12000)

    static var previews: some View {
        Group {
            PortfolioOverviewPerformanceChange(
                data:mockData,
                viewModel: PortofolioPerformanceViewModel()
            )
            PortfolioOverviewPerformanceChange(
                data: mockData,
                viewModel: PortofolioPerformanceViewModel()
            )
            .redacted(reason: .placeholder)
            .shimmering()
        }
    }
}
