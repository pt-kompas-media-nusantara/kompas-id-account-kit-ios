//
//  AuthenticationByAppleDependecy.swift
//  kompasid
//
//  Created by Kompas Digital on 08/05/25.
//

import AuthenticationServices
import ComposableArchitecture
import Foundation

// MARK: - AuthenticationByAppleDependecy
@DependencyClient struct AuthenticationByAppleDependecy {
    var fetch: @Sendable () async throws -> SSOAppleModel
}

extension DependencyValues {
    var authByAppleDependecy: AuthenticationByAppleDependecy {
        get { self[AuthenticationByAppleDependecy.self] }
        set { self[AuthenticationByAppleDependecy.self] = newValue }
    }
}

// MARK: - AuthenticationByAppleDependecy + DependencyKey
extension AuthenticationByAppleDependecy: DependencyKey {
    static var liveValue = Self {
        try await withCheckedThrowingContinuation { continuation in
            let request = ASAuthorizationAppleIDProvider().createRequest()
            request.requestedScopes = [.email, .fullName]

            let controller = ASAuthorizationController(authorizationRequests: [request])

            // ⛔️ Ini akan langsung deinit
            let delegate = AppleSignInDelegate {
                continuation.resume(returning: $0)
            } onError: { error in
                continuation.resume(throwing: error)
            }

            controller.delegate = delegate
            controller.presentationContextProvider = delegate

            // ✅ Strong reference ke delegate agar tidak dealloc
            controller.performRequests()
            objc_setAssociatedObject(controller, &AssociatedKeys.delegate, delegate, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    static let testValue = Self()
}

// MARK: - AssociatedKeys
private enum AssociatedKeys {
    static var delegate = "AppleSignInDelegateKey"
}

// MARK: - AppleSignInDelegate
final class AppleSignInDelegate: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    init(onComplete: @escaping (SSOAppleModel) -> Void, onError: @escaping (Error) -> Void) {
        self.onComplete = onComplete
        self.onError = onError
    }

    let onComplete: (SSOAppleModel) -> Void
    let onError: (Error) -> Void

    func presentationAnchor(for _: ASAuthorizationController) -> ASPresentationAnchor {
        UIApplication.shared.windows.first { $0.isKeyWindow } ?? ASPresentationAnchor()
    }

    func authorizationController(controller _: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            var identityToken = ""
            var authorizationCode = ""

            if let token = credential.identityToken {
                identityToken = String(data: token, encoding: .utf8) ?? ""
            }

            if let code = credential.authorizationCode {
                authorizationCode = String(data: code, encoding: .utf8) ?? ""
            }

            let user: String = credential.user
            let state: String = credential.state ?? ""
            let email: String = credential.email ?? ""
            let namePrefix: String = credential.fullName?.namePrefix ?? ""
            let givenName: String = credential.fullName?.givenName ?? ""
            let middleName: String = credential.fullName?.middleName ?? ""
            let familyName: String = credential.fullName?.familyName ?? ""
            let nameSuffix: String = credential.fullName?.nameSuffix ?? ""
            let nickname: String = credential.fullName?.nickname ?? ""
            let realUserStatus: Int = credential.realUserStatus.rawValue
            let result = SSOAppleModel(
                user: user,
                state: state,
                authorizationCode: authorizationCode,
                identityToken: identityToken,
                email: email,
                namePrefix: namePrefix,
                givenName: givenName,
                middleName: middleName,
                familyName: familyName,
                nameSuffix: nameSuffix,
                nickname: nickname,
                realUserStatus: realUserStatus
            )
            self.onComplete(result)
        } else {
            self.onError(AuthenticationByAppleError.errorCredentialNotFound)
        }
    }

    func authorizationController(controller _: ASAuthorizationController, didCompleteWithError error: Error) {
        self.onError(AuthenticationByAppleError.other(error.localizedDescription))
    }
}
