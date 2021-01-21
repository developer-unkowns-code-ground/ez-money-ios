//
//  WalletDetailView.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 12/01/21.
//

import SwiftUI

struct WalletDetailView: View {
    init(viewModel: WalletDetailViewModel) {
        self.viewModel = viewModel
    }
    
    @ObservedObject private var viewModel: WalletDetailViewModel

    var body: some View {
        HStack {
            VStack {
                TextField(R.string.localizable.formTitleBudget(), text: $viewModel.budget)
                    .frame(height: 56)
                
                Spacer()
                    .frame(height: 7)
                
                Divider()
                
                Spacer()
                    .frame(height: 7)
                
                TextField(R.string.localizable.formTitleWalletName(), text: $viewModel.walletName)
                    .frame(height: 56)
                
                Spacer()
                
                NavigationLink(
                    destination: DailyTransactionView(viewModel: DailyTransactionViewModel()),
                    isActive: $viewModel.isWalletAdded,
                    label: {
                        Button(action: viewModel.addWalletHandler) {
                            Text(R.string.localizable.formButtonAddWallet())
                                .font(R.font.openSansSemiBold.font(size: 16))
                        }
                        .frame(maxWidth: .infinity, minHeight: 56)
                        .background(R.color.accentBlue.color)
                        .foregroundColor(Color.white)
                        .cornerRadius(60)
                    })
                
            }
            .padding(.all, 24)
            
           
            
            Spacer()
        }
        .navigationBarTitle(R.string.localizable.formButtonAddWallet())
    }
}

struct WalletDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = WalletDetailViewModel()
        WalletDetailView(viewModel: viewModel)
    }
}
