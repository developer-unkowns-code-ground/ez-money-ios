//
//  LoginView.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 10/01/21.
//

import SwiftUI
import GoogleSignIn

struct LoginView: View {
    @ObservedObject private var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
            HStack(alignment: .center) {
                Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    HStack(alignment: .center) {
                        VStack {
                            VStack {
                                Image(R.image.bobotLogo.name)
                                    .resizable()
                                    .aspectRatio(1.5, contentMode: .fit)
                            }
                            .frame(height: 255, alignment: .center)
                            .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                            
                            Text(R.string.localizable.appMainName())
                                .font(R.font.poppinsBoldItalic.font(size: 38))
                                .italic()
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            Text(R.string.localizable.appMainTitle())
                                .font(R.font.poppinsBoldItalic.font(size: 24))
                                .italic()
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            Spacer()
                                .frame(height: 50)
                            
                            Button(action: viewModel.loginHandler, label: {
                                Image(R.image.google.name)
                                Text(R.string.localizable.socialLoginGoogle())
                                    .fontWeight(.bold)
                                    .font(R.font.poppinsBold.font(size: 16))
                                    .foregroundColor(.black)
                            })
                            .frame(maxWidth: .infinity, minHeight: 58)
                            .padding(.horizontal, 22)
                            .background(Color.white)
                            .cornerRadius(60)
                        }
                    }
                    Spacer()
                }

                Spacer()
                
                NavigationLink(
                    destination: DashboardView(),
                    isActive: $viewModel.isLoggedIn) {
                    EmptyView()
                }
            }
            .background(R.color.supreme.color)
            .edgesIgnoringSafeArea(.all)
        }
        .onAppear(perform: viewModel.onAppear)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
