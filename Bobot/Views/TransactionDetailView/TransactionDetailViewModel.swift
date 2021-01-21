//
//  TransactionDetailViewModel.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 15/01/21.
//

import Foundation
import Combine

final class TransactionDetailViewModel: ObservableObject {
    @Published var isOutcomeSelected: Bool = true
    @Published var wallet = ""
    @Published var transactionName = ""
    @Published var amount = ""
    @Published var category = ""
    @Published var date = Date()
    
    func toggleTransactionType() {
        isOutcomeSelected.toggle()
    }
}
