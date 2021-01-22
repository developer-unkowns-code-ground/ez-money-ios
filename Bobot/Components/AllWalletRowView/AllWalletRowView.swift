//
//  AllWalletRowView.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 15/01/21.
//

import SwiftUI

struct AllWalletRowView: View {
    var body: some View {
        HStack {
            VStack {
                HStack(alignment: .center) {
                    Image(R.image.bobotIcon.name)
                    Spacer()
                        .frame(width: 12)
                    Image(R.image.bobotIcon.name)
                    Spacer()
                        .frame(width: 12)
                    Image(R.image.bobotIcon.name)
                }
                
                Spacer()
                    .frame(height: 12)
                
                HStack {
                    Text("Transaction from all wallets")
                        .font(R.font.openSansSemiBold.font(size: 16))
                }
                
                Spacer()
                    .frame(height: 12)
                
                HStack(alignment: .center) {
                    Text("Rp 1.500.000")
                        .font(R.font.openSansRegular.font(size: 14))
                        .foregroundColor(R.color.red1.color)
                    
                    Text("Nov expenses")
                        .font(R.font.openSansRegular.font(size: 12))
                        .foregroundColor(R.color.black3.color)
                }
            }
            .padding(34)
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
        .cornerRadius(16)
        .shadow(color: R.color.black1.color.opacity(0.1), radius: 5, x: 0.7, y: 0.7)
    }
}

struct AllWalletRowView_Previews: PreviewProvider {
    static var previews: some View {
        AllWalletRowView()
    }
}
