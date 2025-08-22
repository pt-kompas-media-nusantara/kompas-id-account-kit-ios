////
////  AuthenticationByGoogleDependecy.swift
////  kompasid
////
////  Created by Kompas Digital on 07/05/25.
////
//
//import ComposableArchitecture
//import FirebaseAuth
//import FirebaseCore
//import Foundation
//import GoogleSignIn
//import GoogleUtilities
//import UIKit
//
//// MARK: - AuthenticationByGoogleDependecy
//@DependencyClient struct AuthenticationByGoogleDependecy {
//    // accessTokenByGoogle: String, idTokenByGoogle: String
//    var fetch: @Sendable (UIViewController) async throws -> (String, String)
//}
//
//extension DependencyValues {
//    var authByGoogleDependecy: AuthenticationByGoogleDependecy {
//        get { self[AuthenticationByGoogleDependecy.self] }
//        set { self[AuthenticationByGoogleDependecy.self] = newValue }
//    }
//}
//
//// MARK: - AuthenticationByGoogleDependecy + DependencyKey
//extension AuthenticationByGoogleDependecy: DependencyKey {
//    static var liveValue = Self { vc in
//        guard let app = FirebaseApp.app() else {
//            throw AuthenticationByGoogleError.errorInitFirebaseApp
//        }
//
//        guard let clientID = app.options.clientID else {
//            throw AuthenticationByGoogleError.errorInitFirebaseApp
//        }
//
//        let config = GIDConfiguration(clientID: clientID)
//        GIDSignIn.sharedInstance.configuration = config
//
//        let result: (String, String) = try await withCheckedThrowingContinuation { continuation in
//            GIDSignIn.sharedInstance.signIn(withPresenting: vc) { result, error in
//                if let error {
//                    if error.localizedDescription.lowercased().contains("canceled the sign-in") {
//                        // cancel di popup apple dan cancel di bottom sheet google masuknya ke sini, message di di bawah ini dan di anggap error
//                        // RegisterLandingReducer.swift.body:42 [Optional(dev.AuthenticationByGoogleError.errorSignIn("The user canceled the sign-in flow."))]
//                        continuation.resume(throwing: AuthenticationByGoogleError.canceledSignIn(error.localizedDescription))
//                    } else {
//                        continuation.resume(throwing: AuthenticationByGoogleError.errorSignIn(error.localizedDescription))
//                    }
//                }
//                guard
//                    let user = result?.user,
//                    let idToken = user.idToken?.tokenString else {
//                    return
//                }
//
//                let credential = GoogleAuthProvider.credential(
//                    withIDToken: idToken,
//                    accessToken: user.accessToken.tokenString
//                )
//
//                Auth.auth().signIn(with: credential) { resultsAuth, errorAuth in
//                    guard let result = resultsAuth else {
//                        Logger.info("🔆 \(String(describing: result))")
//                        return
//                    }
//
//                    if let errorAuth {
//                        continuation.resume(throwing: AuthenticationByGoogleError.errorSignIn(errorAuth.localizedDescription))
//                    }
//
//                    let accessTokenByGoogle = user.accessToken.tokenString
//                    let idTokenByGoogle = idToken
//                    continuation.resume(returning: (accessTokenByGoogle, idTokenByGoogle))
//                }
//            }
//        }
//
//        return result
//    }
//
//    static let testValue = Self()
//}
