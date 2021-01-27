//
//  AuthenticationManager.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 24/01/21.
//

import Foundation

class AuthenticationManager {
    static let shared = AuthenticationManager()
    
    func isAuthenticated() -> Bool {
        if accessToken.base64String.isEmpty {
            return false
        }
        
        if accessToken.isExpired {
            return false
        }
        
        return true
    }
    
    var accessToken: AccessToken {
        return AccessToken()
    }
    
    func setUserSession(accessToken: String) {
        UserDefaults.standard.setValue(accessToken, forKey: UserDefaultsKeys.accessToken.rawValue)
        AuthenticationState.shared.isAuthenticated = true
    }
}
