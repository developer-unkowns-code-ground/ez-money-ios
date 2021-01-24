//
//  RequestLoggingInterceptor.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 24/01/21.
//

import Apollo
import Foundation
import Logging

class RequestLoggingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        logger.debug("Outgoing request: \(request)")
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
