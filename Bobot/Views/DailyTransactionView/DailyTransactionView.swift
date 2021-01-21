//
//  DailyTransactionView.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 15/01/21.
//

import SwiftUI

struct DailyTransactionView: View {
    init(viewModel: DailyTransactionViewModel) {
        self.viewModel = viewModel
    }
    
    @ObservedObject private var viewModel: DailyTransactionViewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                        
                    }
                    .frame(height: 158)
                    
                    Spacer()
                        .frame(height: 24)
                    
                    Button(action: {}, label: {
                        Text("View Report")
                            .font(R.font.openSansSemiBold.font(size: 16))
                        Image(R.image.chevronRight.name)
                    })
                    .foregroundColor(R.color.accentBlue.color)
                    
                    Spacer()
                        .frame(height: 24)
                    
                    HStack {
                        EmptyTransactionView()
                    }
                    .padding(24)
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    NavigationLink(
                        destination: TransactionDetailView(viewModel: TransactionDetailViewModel()),
                        label: {
                            VStack {
                                Text("+")
                                    .font(R.font.openSansRegular.font(size: 36))
                            }
                            .frame(width: 56, height: 56)
                            .background(R.color.accentBlue.color)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                        })
                    
                    
                }
                .padding(.horizontal, 24)
            }
        }
        .navigationBarTitle("Daily Transaction")
    }
}

struct DailyTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = DailyTransactionViewModel()
        DailyTransactionView(viewModel: viewModel)
    }
}
