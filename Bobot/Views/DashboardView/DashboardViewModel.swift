//
//  DashboardViewModel.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 10/01/21.
//

import Combine

final class DashboardViewModel: ViewModel {
    func onAppear() {
        getMyWallet()
    }
    
    private func getMyWallet() {
        let query = GetMyWalletQuery()
        Network.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
