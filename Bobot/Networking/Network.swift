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
        let url = URL(string: keys.schemaURL)!
        
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let client = URLSessionClient()
        
        let provider = NetworkInterceptorProvider(store: store, client: client)
        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        
        return ApolloClient(
            networkTransport: transport, store: store
        )
    }
}
