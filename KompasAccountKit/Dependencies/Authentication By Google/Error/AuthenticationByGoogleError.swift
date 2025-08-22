//
//  AuthenticationByGoogleError.swift
//  kompasid
//
//  Created by Kompas Digital on 07/05/25.
//

import Foundation

// MARK: - AuthenticationByGoogleError
public enum AuthenticationByGoogleError: Equatable, LocalizedError, Sendable {
    case errorInitFirebaseApp
    case canceledSignIn(String)
    case errorSignIn(String)

    public var errorDescription: String? {
        switch self {
        case .errorInitFirebaseApp:
            return "Error Init FirebaseApp.app()"
        case .canceledSignIn(let value):
            return value
        case .errorSignIn(let value):
            return "Error SignIn \(value)"
        }
    }
}
