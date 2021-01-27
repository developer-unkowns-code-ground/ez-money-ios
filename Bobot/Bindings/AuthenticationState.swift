//
//  AuthenticationState.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 17/01/21.
//

import Combine
import Foundation

class AuthenticationState: NSObject, ObservableObject {
    @Published var isAuthenticated: Bool
    
    override private init() {
        isAuthenticated = AuthenticationManager.shared.isAuthenticated()
        super.init()
    }
    
    static let shared = AuthenticationState()
}
 
