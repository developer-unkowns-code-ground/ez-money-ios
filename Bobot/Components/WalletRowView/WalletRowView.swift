//
//  WalletRowView.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 14/01/21.
//

import SwiftUI

struct WalletRowView: View {
    @State var walletName = ""
    @State var walletAmount = ""
    
    var body: some View {
        HStack {
            VStack {
                HStack(alignment: .center) {
                    Image(R.image.bobotIcon.name)
                    Spacer()
                    VStack {
                        Text("Wallet Name")
                            .foregroundColor(R.color.black1.color.opacity(0.3))
                            .font(R.font.poppinsRegular.font(size: 12))
                        
                        Spacer()
                            .frame(height: 4)
                        
                        Text($walletName.wrappedValue)
                            .foregroundColor(R.color.black1.color)
                            .font(R.font.poppinsRegular.font(size: 12))
                    }
                }
                
                Spacer()
                    .frame(height: 58)
                
                HStack {
                    VStack {
                        Text($walletAmount.wrappedValue)
                            .font(R.font.poppinsBold.font(size: 20))
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
        .cornerRadius(16)
        .shadow(color: R.color.black1.color.opacity(0.1), radius: 5, x: 0.7, y: 0.7)
    }
}

struct WalletRowView_Previews: PreviewProvider {
    static var previews: some View {
        WalletRowView(walletName: "Mandiri Syariah", walletAmount: "Rp 20.000.000")
    }
}
