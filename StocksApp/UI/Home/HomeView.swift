//
//  HomeView.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                WelcomeHeader(username: "Andrei Avram")
                Spacer()
            }
            HStack {
                PortfolioPerformanceOverview()
                Spacer()
            }
            Spacer()
        }.padding(UIStyles.Dimens.spaceLarge).padding([.top], UIStyles.Dimens.spaceXLarge)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
