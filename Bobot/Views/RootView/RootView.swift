//
//  RootView.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 13/01/21.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var authState: AuthenticationState
    
    var body: some View {
        Group {
            if authState.isAuthenticated {
                let viewModel = DashboardViewModel()
                DashboardView(viewModel: viewModel)
            } else {
                let viewModel = LoginViewModel()
                LoginView(viewModel: viewModel)
            }
        }
        .animation(.easeInOut)
        .transition(.move(edge: .leading))
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
