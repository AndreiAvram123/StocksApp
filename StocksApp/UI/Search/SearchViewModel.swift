//
//  SearchViewModel.swift
//  StocksApp
//
//  Created by Andrei Avram on 08.02.2023.
//

import Foundation
import Combine

class SearchViewModel : ObservableObject {
    enum SearchViewState {
        case initial
        case loading
        case error
        case success(data: [SearchSymbol])
    }
    @Published var viewState: SearchViewState = .initial
    private var cancellables = Set<AnyCancellable>()
    private let searchRepo: SearchRepo
    private var searchCancellable: Cancellable? = nil

    init() {
        self.searchRepo = SearchRepoImpl()
    }

    func getSearchResult(query: String){
        searchCancellable?.cancel()
        if query.isEmpty {
            viewState = .initial
            return
        }
        viewState = .loading
        searchCancellable =  searchRepo.searchByQuery(query: query)
            .receive(on: DispatchQueue.main )
            .sink(receiveCompletion : {
                completion in
                if case .failure = completion {
                    self.viewState = .error
                }
                print(completion)

            }) { [weak self] data in
                self?.viewState = .success(data: data.result)
            }
    }
}
