//
//  StocksApp
//
//  Created by Andrei Avram on 08.02.2023.
//

import Foundation
import Combine
import Factory

class StockViewViewModel : ObservableObject {

    @Injected(Container.companyRepo) var companyRepo: CompanyRepo
    private var cancellables = Set<AnyCancellable>()

    enum ViewState {
         case initial
         case loading
         case success(data: CompanyProfile)
         case error
    }
    @Published var viewState: ViewState = .initial

    func getCompanyProfileBySymbol(symbol: String) {
        companyRepo.fetchCompanyProfileBySymbol(symbol: symbol)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { value in
                self.viewState = .success(data: value)
            }.store(in: &cancellables)

    }
    
}
