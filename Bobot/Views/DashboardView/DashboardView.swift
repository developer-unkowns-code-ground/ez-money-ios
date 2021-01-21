//
//  DashboardView.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 10/01/21.
//

import SwiftUI

struct DashboardView: View {
    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
    }
    
    @ObservedObject private var viewModel: DashboardViewModel
    
    var body: some View {
        NavigationView {
            HStack {
                ScrollView {
                    VStack(alignment: .center) {
                        VStack {
                            EmptyWalletView()
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 24)
                            
                            Spacer()
                                .frame(height: 65)
                            
                            VStack {
                                NavigationLink(
                                    destination: WalletDetailView(viewModel: WalletDetailViewModel())) {
                                    VStack {
                                        Image(R.image.plus.name)
                                        Text(R.string.localizable.walletAddText())
                                    }
                                    .frame(height: 120)
                                    .frame(maxWidth: .infinity)
                                    .background(R.color.cardBackground.color)
                                    .cornerRadius(16)
                                }
                            }
                        }
                    }
                }
                .padding(.all)
                
                Spacer()
            }
            .navigationBarTitle("Your Wallet")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = DashboardViewModel()
        DashboardView(viewModel: viewModel)
    }
}
