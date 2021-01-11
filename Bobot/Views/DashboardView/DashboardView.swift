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
                VStack(alignment: .leading) {
                    EmptyWalletView()
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
