//
//  PortofolioChange.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import SwiftUI

struct PortfolioOverviewPerformanceChange: View {
    var amount: Int
    var percentage: Int
    var negativePerformance: Bool
    var viewModel: PortofolioPerformanceViewModel

    var body: some View {
        let formattedAmount = viewModel.formatToUnit(amount: amount)
        if negativePerformance {
            Text("↓ -\(formattedAmount) (\(percentage)%)")
                .padding()
                .foregroundColor(Color(R.color.lavaRed))
                .background(Color(R.color.pearl))
                .clipShape(Capsule())
        } else {
            Text("↑ \(formattedAmount) (\(percentage)%)")
                .padding()
                .foregroundColor(Color(R.color.forestgreen))
                .background(Color(R.color.pearl))
                .clipShape(Capsule())
        }
    }
}

struct PortofolioChange_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioOverviewPerformanceChange(
            amount: 1000,
            percentage : 10,
            negativePerformance: true,
            viewModel: PortofolioPerformanceViewModel()
        )
    }
}
