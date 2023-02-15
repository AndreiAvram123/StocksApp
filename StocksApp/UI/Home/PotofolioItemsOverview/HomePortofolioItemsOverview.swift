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
            Text("Portfolio")
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
    var data: [CompanyProfile]
    
    var body: some View {
        ScrollView(.horizontal){
            HStack {
                ForEach(data, id: \.name) { item in
                     HomePortfolioItem(
                        companyProfile: item,
                        financialItemUpdate: FinancialItemQuote(currentPrice: 150, change: 20, precentageChange: 5
                     )
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
            CompanyProfile.mockInstance(),
            CompanyProfile.mockInstance(),
            CompanyProfile.mockInstance()
        ])
        return viewModel
    }
    static var previews: some View {
        HomePortofolioItemsOverview(viewModel: successViewModel)
    }
}
