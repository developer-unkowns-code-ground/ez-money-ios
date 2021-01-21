//
//  TransactionView.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 10/01/21.
//

import SwiftUI

struct TransactionView: View {
    init(viewModel: TransactionViewModel) {
        self.viewModel = viewModel
    }
    
    @ObservedObject private var viewModel: TransactionViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TransactionViewModel()
        TransactionView(viewModel: viewModel)
    }
}
