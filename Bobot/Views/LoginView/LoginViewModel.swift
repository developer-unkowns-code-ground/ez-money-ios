//
//  LoginViewModel.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 10/01/21.
//

import Combine

final class LoginViewModel: ObservableObject {
    @Published var isLogginable: Bool = false
    
    func didTapLoginButton() {
        isLogginable = true
    }
}
