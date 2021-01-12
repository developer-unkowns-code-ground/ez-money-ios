//
//  DashboardView.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 10/01/21.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
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
                                destination: WalletDetailView()) {
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
            .navigationBarTitle("Your Wallet")
            
            Spacer()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}