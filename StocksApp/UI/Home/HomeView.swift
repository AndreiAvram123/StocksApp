//
//  HomeView.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: PortofolioPerformanceViewModel = PortofolioPerformanceViewModel()

    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                WelcomeHeader(username: "Andrei Avram")
                Spacer()
            }
            HStack {
                PortfolioPerformanceOverview(
                viewModel: viewModel
                )
                Spacer()
            }.padding(.top, UIStyles.Dimens.spaceMedium)
            PortfolioPerformanceChart(
                viewModel: viewModel
            ).padding(.top)
            Spacer()
        }.padding(UIStyles.Dimens.spaceLarge).padding([.top], UIStyles.Dimens.spaceXLarge)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
