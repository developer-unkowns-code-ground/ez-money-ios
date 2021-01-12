//
//  EmptyWalletView.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 11/01/21.
//

import SwiftUI

struct EmptyWalletView: View {
    var body: some View {
        HStack {
            VStack {
                VStack {
                    Image(R.image.emptyWallet.name)
                        .frame(width: 120, height: 150, alignment: .center)
                    
                    Spacer()
                        .frame(height: 14)
                    
                    Text(R.string.localizable.walletEmptyTitle())
                        .font(R.font.poppinsBold.font(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(R.color.black1.color)
                    
                    Spacer()
                        .frame(height: 10)

                    Text(R.string.localizable.walletEmptySubtitle())
                        .font(R.font.poppinsRegular.font(size: 14))
                        .foregroundColor(R.color.black1.color)
                }
            }
        }
    }
}

struct EmptyWalletView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyWalletView()
    }
}
