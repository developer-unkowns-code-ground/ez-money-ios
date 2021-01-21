//
//  WalletDetailViewModel.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 12/01/21.
//

import Combine

final class WalletDetailViewModel: ViewModel {
    @Published var budget: String = ""
    @Published var walletName: String = ""
    @Published var isWalletAdded: Bool = false
    
    func addWalletHandler() {
        isWalletAdded = true
    }
}
