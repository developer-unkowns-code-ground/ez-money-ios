//
//  Network.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 23/01/21.
//

import Apollo
import Foundation
import Keys

struct Network {
    static let shared = Network()
    
    var apollo: ApolloClient {
        let keys = BobotKeys()
        return ApolloClient(url: URL(string: keys.schemaURL)!)
    }
}
