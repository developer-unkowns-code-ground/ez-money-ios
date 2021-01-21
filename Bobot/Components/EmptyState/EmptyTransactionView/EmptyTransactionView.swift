//
//  EmptyTransactionView.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 15/01/21.
//

import SwiftUI

struct EmptyTransactionView: View {
    var body: some View {
        HStack {
            VStack {
                VStack {
                    Image(R.image.emptyStateTransaction.name)
                        .frame(width: 120, height: 150, alignment: .center)
                    
                    Spacer()
                        .frame(height: 14)
                    
                    Text(R.string.localizable.transactionEmptyTitle())
                        .font(R.font.poppinsBold.font(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(R.color.black1.color)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Text(R.string.localizable.transactionEmptySubtitle())
                        .font(R.font.poppinsRegular.font(size: 14))
                        .foregroundColor(R.color.black1.color)
                }
                
                Spacer()
                    .frame(height: 16)
            }
        }
    }
}

struct EmptyTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyTransactionView()
    }
}
