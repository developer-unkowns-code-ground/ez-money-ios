//
//  LoginViewModel.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 10/01/21.
//

import Combine
import GoogleSignIn

final class LoginViewModel: NSObject, ViewModel {
    @Published var isLoggedIn: Bool = false
    
    func loginHandler() {
        isLoggedIn = true
        
//        GIDSignIn.sharedInstance()?.signIn()
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
        
        let userId = user.userID                  // For client-side use only!
        let idToken = user.authentication.idToken // Safe to send to the server
        let fullName = user.profile.name
        let givenName = user.profile.givenName
        let familyName = user.profile.familyName
        let email = user.profile.email
        let accessToken = user.authentication.accessToken
        
        UserDefaults.standard.setValue(true, forKey: UserDefaultsKeys.isSignedIn.rawValue)
        
        print("accessToken: ", accessToken)
        print("idToken: ", idToken)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}
