//
//  AuthenticationInterceptor.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 30/01/21.
//

import Apollo

final class AuthenticationInterceptor: ApolloInterceptor {
    enum UserError: Error {
        case noUserLoggedIn
    }
    
    func interceptAsync<Operation: GraphQLOperation>(
            chain: RequestChain,
            request: HTTPRequest<Operation>,
            response: HTTPResponse<Operation>?,
            completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        let accessToken = AuthenticationManager.shared.accessToken
        
        if accessToken.isExpired {
            let error = UserError.noUserLoggedIn
            chain.handleErrorAsync(error, request: request, response: response, completion: completion)
            return
        }
        
        addTokenAndProceed(
            accessToken,
            to: request,
            chain: chain,
            response: response,
            completion: completion
        )
    }
    
    private func addTokenAndProceed<Operation: GraphQLOperation>(
        _ token: AccessToken,
        to request: HTTPRequest<Operation>,
        chain: RequestChain,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        let tokenString = token.base64String
        let accessToken = "Bearer \(tokenString)"
        
        request.addHeader(name: "Authorization", value: accessToken)
        
        chain.proceedAsync(
            request: request,
            response: response,
            completion: completion
        )
    }
}
