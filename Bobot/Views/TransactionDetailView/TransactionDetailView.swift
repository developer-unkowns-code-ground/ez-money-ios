//
//  TransactionDetailView.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 15/01/21.
//

import SwiftUI

struct TransactionDetailView: View {
    init(viewModel: TransactionDetailViewModel) {
        self.viewModel = viewModel
    }
    
    @ObservedObject private var viewModel: TransactionDetailViewModel
    
    @State var selected = 1
    
    private var TogglerView: some View {
        let outcomeTextColor = viewModel.isOutcomeSelected ? R.color.black2.color : R.color.black2.color.opacity(0.3)
        let incomeTextColor = viewModel.isOutcomeSelected ? R.color.black2.color.opacity(0.3) : R.color.black2.color
        
        return VStack {
            GeometryReader { geo in
                ZStack(alignment: viewModel.isOutcomeSelected ? .leading : .trailing) {
                    Capsule()
                        .frame(width: geo.size.width, height: 52, alignment: .center)
                        .foregroundColor(R.color.gray1.color)
                    
                    Capsule()
                        .frame(width: geo.size.width * 0.5, height: 48, alignment: .center)
                        .foregroundColor(.white)
                        .padding(2)
                        .shadow(color: R.color.black1.color.opacity(0.1), radius: 5, x: 0.7, y: 0.7)
                    
                    HStack {
                        Text("Outcome")
                            .font(R.font.openSansSemiBold.font(size: 14))
                            .foregroundColor(outcomeTextColor)
                        Spacer()
                        Text("Income")
                            .font(R.font.openSansSemiBold.font(size: 14))
                            .foregroundColor(incomeTextColor)
                    }.padding(.horizontal, geo.size.width * 0.175)
                }
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2), viewModel.toggleTransactionType)
                }
            }
            
            Spacer()
                .frame(height: 36)
        }
        .padding(.all, 24)
    }
    
    private struct FloatingTextField: View {
        let title: String
        let text: Binding<String>
        
        var body: some View {
            let isEmpty = text.wrappedValue.isEmpty
            let foregroundColor = isEmpty ? Color(.placeholderText) : R.color.black1.color
            
            return VStack {
                Spacer()
                    .frame(height: 20)
                
                ZStack(alignment: .leading) {
                    Text(title)
                        .font(R.font.openSansRegular.font(size: 16))
                        .foregroundColor(foregroundColor)
                        .offset(y: isEmpty ? 0 : -35)
                        .scaleEffect(isEmpty ? 1 : 0.8, anchor: .leading)
                    TextField("", text: text)
                        .font(R.font.openSansSemiBold.font(size: 16))
                        .frame(height: 24)
                }
                .frame(height: 36)
                .animation(.spring(response: 0.2, dampingFraction: 0.5))

                Divider()
                
                Spacer()
                    .frame(height: 12)
            }
        }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    TogglerView
                    
                    FloatingTextField(title: "Wallet", text: $viewModel.wallet)
                    
                    FloatingTextField(title: "Transaction Name", text: $viewModel.transactionName)
                    
                    FloatingTextField(title: "Amount", text: $viewModel.amount)
                    
                    VStack {
                        VStack {
                            DatePicker(selection: $viewModel.date, displayedComponents: [.date]) {
                                Text("Date")
                                    .foregroundColor(Color(.placeholderText))
                            }
                        }
                        .font(R.font.openSansRegular.font(size: 16))
                        .frame(height: 56)
                        Divider()
                    }
                    
                    FloatingTextField(title: "Category", text: $viewModel.category)
                }
                .padding(24)
            }
            
            Button(action: {}) {
                Text(R.string.localizable.formButtonSave())
                    .font(R.font.openSansSemiBold.font(size: 16))
            }
            .frame(maxWidth: .infinity, minHeight: 56)
            .background(R.color.accentBlue.color)
            .disabled(true)
            .foregroundColor(Color.white)
            .cornerRadius(60)
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
        .navigationBarTitle("Input Transaction")
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TransactionDetailViewModel()
        TransactionDetailView(viewModel: viewModel)
    }
}
