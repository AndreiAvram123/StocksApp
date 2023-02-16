//
//  HomePortfolioItem.swift
//  StocksApp
//
//  Created by Andrei Avram on 15.02.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomePortfolioItem: View {
    var companyProfile: CompanyProfile
    var currentPrice: Double
    var percentageChange: Double
    var amountChange: Double
    var isNegativeChange: Bool

    var body : some View {
        VStack(alignment: .leading) {
            HStack {
                WebImage(url: URL(string: companyProfile.logo))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)

                VStack(alignment: .leading) {
                    Text(companyProfile.ticker)
                        .font(UIStyles.Headline.font)
                        .foregroundColor(UIStyles.Headline.color)

                    Text(companyProfile.name)
                        .font(UIStyles.BodySmall.font)
                        .foregroundColor(
                            Color(R.color.stormDust)
                        )
                }.padding(.leading, UIStyles.Dimens.spaceSmall)
            }
            HStack(){
                Text(currentPrice.twoDecimalString())
                    .font(UIStyles.Headline.font)
                    .foregroundColor(UIStyles.Headline.color)
                HomePortfolioItemChange(
                    amountChange: amountChange,
                    procentageChange: percentageChange,
                    isNegativeChange: isNegativeChange
                )
            }
        }.padding().background(Color(R.color.blueChalk)).clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct HomePortfolioItem_Previews: PreviewProvider {
    static var previews: some View {
        HomePortfolioItem(
            companyProfile: CompanyProfile.mockInstance(),
            currentPrice: 150,
            percentageChange: 5, amountChange: 10,isNegativeChange: false
        ).padding()
    }
}
