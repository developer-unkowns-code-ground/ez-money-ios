//
//  LoginViewModel.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 10/01/21.
//

import Apollo
import Combine
import GoogleSignIn

final class LoginViewModel: NSObject, ViewModel {
    @Published var isLoading = false
    
    func loginHandler() {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    func onAppear() {
        GIDSignIn.sharedInstance()?.clientID = "1068092152608-lsuk4hmkrm6v60dmk5dsq0hng8grqk3t.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
    }
}

extension LoginViewModel: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        
        let token = user.authentication.idToken ?? ""
        performSignIn(with: token)
    }
    
    private func performSignIn(with token: String) {
        let mutation = LoginMutation(token: token)
        
        isLoading = true
        
        Network.shared.apollo.perform(mutation: mutation) { [weak self] result in
            switch result {
            case .success(let response):
                let accessToken = response.data?.login.accessToken ?? ""
                AuthenticationManager.shared.setUserSession(accessToken: accessToken)
            case .failure(let error):
                print("===========")
                print("error", error)
            }
            
            self?.isLoading = false
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}
