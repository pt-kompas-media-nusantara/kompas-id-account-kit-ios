//
//  AuthenticationByAppleError.swift
//  kompasid
//
//  Created by Kompas Digital on 08/05/25.
//

import Foundation

public enum AuthenticationByAppleError: Equatable, LocalizedError, Sendable {
    case errorCredentialNotFound
    case other(String)

    public var errorDescription: String? {
        switch self {
        case .errorCredentialNotFound:
            return "AppleSignIn : Credential tidak ditemukan"
        case let .other(error):
            return error
        }
    }
}
