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
        
        loadSomeData { result in
            print("====")
        }
        
        Network.shared.apollo.perform(mutation: mutation) { result in
            DispatchQueue.main.async {
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
//
//        print(request)
    }
    
    enum ErrorC: Swift.Error {
        case badURL
        case badData
        case other(Swift.Error)
    }
    
    func loadSomeData(then block: @escaping(Result<Data, ErrorC>) -> Void) {
        let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                block(.failure(.other(error!)))
                return
            }
            
            guard let data = data else {
                block(.failure(.badURL))
                return
            }
            
            block(.success(data))
        }
        
        task.resume()
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}
