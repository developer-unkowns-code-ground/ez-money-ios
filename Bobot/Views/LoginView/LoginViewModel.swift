//
//  LoginViewModel.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 10/01/21.
//

import Combine
import GoogleSignIn

final class LoginViewModel: NSObject, ViewModel {
    func loginHandler() {
//        AuthenticationState.shared.isAuthenticated = true
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
         // For client-side use only!
        let token = user.authentication.idToken ?? ""
        performSignIn(with: token)
        
        UserDefaults.standard.setValue(true, forKey: UserDefaultsKeys.isSignedIn.rawValue)
    }
    
    private func performSignIn(with token: String) {
        let mutation = LoginMutation(token: token)
        Network.shared.apollo.perform(mutation: mutation, publishResultToStore: false, queue: .global(qos: .background)) { result in
            
            print("+=====")
            switch result {
            case .success(let data):
                print("===========")
                print(data)
            case .failure(let error):
                print("===========")
                print("error", error)
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}
