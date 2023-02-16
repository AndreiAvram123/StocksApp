//
//  HomeView.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: PortofolioPerformanceViewModel = PortofolioPerformanceViewModel()

    var body: some View {
        VStack (alignment: .leading, spacing: UIStyles.Dimens.spaceLarge) {
            HStack {
                WelcomeHeader(username: "Andrei Avram")
                Spacer()
            }
            HStack {
                PortfolioPerformanceOverview(
                viewModel: viewModel)
                Spacer()
            }
            PortfolioPerformanceChart(
                viewModel: viewModel
            )
            HomePortofolioItemsOverview()
            Spacer()
        }.padding(UIStyles.Dimens.spaceLarge).padding([.top], UIStyles.Dimens.spaceXLarge)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
