//
//  HomePortofolioItemsOverview.swift
//  StocksApp
//
//  Created by Andrei Avram on 15.02.2023.
//

import SwiftUI
import SDWebImageSwiftUI



struct HomePortofolioItemsOverview: View {

    @StateObject var viewModel: HomePortfolioItemsViewModel = HomePortfolioItemsViewModel()

    var body: some View {
        VStack {
            HStack {
                Text(R.string.localizable.homeScreenPortfolioItemsOverviewSectionTitle)
                    .font(UIStyles.Headline.font)
                    .foregroundColor(UIStyles.Headline.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            switch viewModel.viewState {
            case .success(let data) :
                SuccessState(data: data)
            case .loading :
                //todo
                 Text("Loading")
            default :
                EmptyView()
            }
        }.onAppear {
            viewModel.getPortfolioItems()
        }
    }
}

private struct SuccessState : View {
    var data: [HomePortfolioItemModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: UIStyles.Dimens.spaceLarge) {
                ForEach(data, id: \.companyProfile.ticker) { item in
                     HomePortfolioItem(
                        companyProfile: item.companyProfile,
                        quote: item.quote
                     )
                }
            }
        }
    }
}

struct HomePortofolioItemsOverview_Previews: PreviewProvider {
    static var successViewModel: HomePortfolioItemsViewModel {
        let viewModel = HomePortfolioItemsViewModelMock()
        viewModel.mockState = .success(data: [
            HomePortfolioItemModel.mockInstance,
            HomePortfolioItemModel.mockInstance,
            HomePortfolioItemModel.mockInstance,
        ])
        return viewModel
    }
    static var previews: some View {
        HomePortofolioItemsOverview(viewModel: successViewModel)
    }
}
