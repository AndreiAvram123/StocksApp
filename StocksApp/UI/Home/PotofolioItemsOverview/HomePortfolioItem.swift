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
    @State var quote: StockQuote

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
                Text(String(quote.currentPrice))
                    .font(UIStyles.Headline.font)
                    .foregroundColor(UIStyles.Headline.color)
                HomePortfolioItemChange(
                    amountChange: quote.change, procentageChange: quote.precentageChange
                )
            }
        }.padding().background(Color(R.color.blueChalk)).clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct HomePortfolioItem_Previews: PreviewProvider {
    static var previews: some View {
        HomePortfolioItem(companyProfile: CompanyProfile.mockInstance(),
                          quote:StockQuote.mockInstance).padding()
    }
}
