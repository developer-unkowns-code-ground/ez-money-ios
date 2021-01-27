//
//  AccessToken.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 24/01/21.
//

import Foundation

struct AccessToken {
    var isExpired: Bool {
        return true
    }
    
    var base64String: String {
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken.rawValue)
        return accessToken ?? ""
    }
}
