// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetMyWalletQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetMyWallet {
      GetMyWallet {
        __typename
        id
        amount
        name
      }
    }
    """

  public let operationName: String = "GetMyWallet"

  public let operationIdentifier: String? = "70813c7ed9449ff2a83b95eaeea71cdf4b88499c4c56867e0f626ffbd5b236bf"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("GetMyWallet", type: .list(.nonNull(.object(GetMyWallet.selections))))
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getMyWallet: [GetMyWallet]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "GetMyWallet": getMyWallet.flatMap { (value: [GetMyWallet]) -> [ResultMap] in value.map { (value: GetMyWallet) -> ResultMap in value.resultMap } }])
    }

    public var getMyWallet: [GetMyWallet]? {
      get {
        return (resultMap["GetMyWallet"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [GetMyWallet] in value.map { (value: ResultMap) -> GetMyWallet in GetMyWallet(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetMyWallet]) -> [ResultMap] in value.map { (value: GetMyWallet) -> ResultMap in value.resultMap } }, forKey: "GetMyWallet")
      }
    }

    public struct GetMyWallet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Wallet"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self)))
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, amount: Int, name: String) {
        self.init(unsafeResultMap: ["__typename": "Wallet", "id": id, "amount": amount, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var amount: Int {
        get {
          return resultMap["amount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($token: String!) {
      login(login: {token: $token}) {
        __typename
        accessToken
      }
    }
    """

  public let operationName: String = "Login"

  public let operationIdentifier: String? = "cca2f85d3dc092adaab03d686cf33412998debb2bf710e80173f49e0c02d03df"

  public var token: String

  public init(token: String) {
    self.token = token
  }

  public var variables: GraphQLMap? {
    return ["token": token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["login": ["token": GraphQLVariable("token")]], type: .nonNull(.object(Login.selections)))
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LoginResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("accessToken", type: .nonNull(.scalar(String.self)))
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(accessToken: String) {
        self.init(unsafeResultMap: ["__typename": "LoginResponse", "accessToken": accessToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var accessToken: String {
        get {
          return resultMap["accessToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accessToken")
        }
      }
    }
  }
}
