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
                                Image("BobotLogo")
                                    .resizable()
                                    .aspectRatio(1.5, contentMode: .fit)
                            }
                            .frame(height: 255, alignment: .center)
                            .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                            
                            Text(R.string.localizable.appMainName())
                                .font(.custom("Poppins-BoldItalic", size: 48))
                                .italic()
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            Text(R.string.localizable.appMainTitle())
                                .font(.custom("Poppins-BoldItalic", size: 24))
                                .italic()
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            Spacer()
                                .frame(height: 50)
                            
                            Button(action: viewModel.didTapLoginButton, label: {
                                Image("Google")
                                Text(R.string.localizable.socialLoginGoogle())
                                    .fontWeight(.bold)
                                    .font(.custom("Poppins-Bold", size: 16))
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
                    isActive: $viewModel.isLogginable) {
                    EmptyView()
                }
            }
            .background(Color("Supreme"))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
