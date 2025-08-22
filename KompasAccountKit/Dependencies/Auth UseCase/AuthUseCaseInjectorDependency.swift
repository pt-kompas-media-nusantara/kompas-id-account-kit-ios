//
//  AuthUseCaseInjectorDependency.swift
//  kompasid
//
//  Created by Kompas Digital on 12/03/25.
//

import ComposableArchitecture
import Foundation
import KompasIdLibrary

// MARK: - AuthUseCaseDependecy
@DependencyClient struct AuthUseCaseDependecy {
    var checkRegisteredUsers: @Sendable (String) async throws -> CheckRegisteredUsersModelWrapper
    var loginByEmailAndFetchProfile: @Sendable (_ email: String, _ password: String) async throws -> Void
    var loginByGoogleAndFetchProfile: @Sendable (_ accessTokenByGoogle: String, _ idTokenByGoogle: String) async throws -> Void
    var loginByAppleAndFetchProfile: @Sendable (_ accessTokenByApple: String) async throws -> Void
    var loginByPurchaseTokenAndFetchProfile: @Sendable () async throws -> Void
}

extension DependencyValues {
    var authUseCaseDependecy: AuthUseCaseDependecy {
        get { self[AuthUseCaseDependecy.self] }
        set { self[AuthUseCaseDependecy.self] = newValue }
    }
}

// MARK: - AuthUseCaseDependecy + DependencyKey
extension AuthUseCaseDependecy: DependencyKey {
    static let authUseCase: AuthUseCase = KoinInjector().authUseCase
    

    static var liveValue: Self {
        return Self(
            checkRegisteredUsers: { text in
                let result = try await authUseCase.checkRegisteredUsers(value: text)
                switch result {
                case let success as ResultsSuccess<CheckRegisteredUsersResInterceptor>:
                    guard let data = success.data else {
                        throw ApiServicesError.unknown(message: "Error : ResultsSuccess<CheckRegisteredUsersResInterceptor>")
                    }
                    return CheckRegisteredUsersModelWrapper(
                        text: data.text,
                        registered: data.registered,
                        registeredType: registeredTypeMappers(data: data.registeredType)
                    )

                case let error as ResultsError<NetworkError>:
                    throw ApiErrorMapper.map(error)

                default:
                    throw ApiServicesError.unknown(message: "Error: checkRegisteredUsers")
                }
            },
            loginByEmailAndFetchProfile: { email, password in
                let result = try await authUseCase.loginByEmailAndFetchProfile(email: email, password: password)
                switch result {
                case let success as ResultsSuccess<UserDetailsAndMembershipResInterceptor>:
                    Logger.debug("\(success.data)")
                    return
                case let error as ResultsError<NetworkError>:
                    throw ApiErrorMapper.map(error)

                default:
                    throw ApiServicesError.unknown(message: "Error: loginByEmailAndFetchProfile")
                }
            },
            loginByGoogleAndFetchProfile: { accessTokenByGoogle, idTokenByGoogle in
                let result = try await authUseCase.loginByGoogleAndFetchProfile(accessTokenByGoogle: accessTokenByGoogle, idTokenByGoogle: idTokenByGoogle)
                switch result {
                case let success as ResultsSuccess<UserDetailsAndMembershipResInterceptor>:
                    Logger.debug("\(success.data)")
                    return
                case let error as ResultsError<NetworkError>:
                    throw ApiErrorMapper.map(error)
                default:
                    throw ApiServicesError.unknown(message: "Error: loginByGoogleAndFetchProfile")
                }
            },
            loginByAppleAndFetchProfile: { accessTokenByApple in
                let result = try await authUseCase.loginByAppleAndFetchProfile(accessTokenByApple: accessTokenByApple)
                switch result {
                case let success as ResultsSuccess<UserDetailsAndMembershipResInterceptor>:
                    Logger.debug("\(success.data)")
                    return
                case let error as ResultsError<NetworkError>:
                    throw ApiErrorMapper.map(error)
                default:
                    throw ApiServicesError.unknown(message: "Error: loginByAppleAndFetchProfile")
                }
            },
            loginByPurchaseTokenAndFetchProfile: {
                let result = try await authUseCase.loginByPurchaseTokenAndFetchProfile()
                switch result {
                case let success as ResultsSuccess<UserDetailsAndMembershipResInterceptor>:
                    Logger.debug("\(success.data)")
                    return
                case let error as ResultsError<NetworkError>:
                    throw ApiErrorMapper.map(error)
                default:
                    throw ApiServicesError.unknown(message: "Error: loginByPurchaseTokenAndFetchProfile")
                }
            }
        )
    }

    static let testValue = Self(
        checkRegisteredUsers: { _ in
            CheckRegisteredUsersModelWrapper(text: "Test", registered: false, registeredType: [])
        },
        loginByEmailAndFetchProfile: { _, _ in
        },
        loginByGoogleAndFetchProfile: { _, _ in

        },
        loginByAppleAndFetchProfile: { _ in

        },
        loginByPurchaseTokenAndFetchProfile: {}
    )

    static func registeredTypeMappers(data: [KotlinInt]) -> [Int] {
        data.map { Int(truncating: $0) }
    }
}

// private enum AuthUseCaseInjectorKey: DependencyKey {
//    static var authUseCase: AuthUseCase = KoinInjector().authUseCase
//
//    static var liveValue = AuthUseCaseDependecy(
//        login: { _ in
//            //            let result = try await authUseCase.loginByEmail(
//            //                email: data.email,
//            //                password: data.password,
//            //            )
//            //
//            //            switch result {
//            //            case is ResultsSuccess<NSString>:
//            //                if let success = result as? ResultsSuccess<NSString> {
//            //                    return success.data as? String ?? ""
//            //                }
//            //            case is ResultsError<NetworkError>:
//            //                if let errorWrapper = result as? ResultsError<NetworkError> {
//            //                    throw NetworkRequestError.kmpErrorMapper(error: errorWrapper)
//            //                }
//            //
//            //            default:
//            //                throw NSError(domain: "Unexpected result", code: -1, userInfo: nil)
//            //            }
//
//            nil
//        },
//        signOut: {
//            let result = try await authUseCase.logout()
//        },
//        checkRegisteredUsers: { text in
//            do {
//                let result = try await authUseCase.checkRegisteredUsers(value: text)
//                if let success = result as? ResultsSuccess<CheckRegisteredUsersResInterceptor> {
//                    guard let data = success.data else {
//                        throw NetworkRequestError.badRequest
//                    }
//
//                    Logger.debug("\(data)")
//
//                    return CheckRegisteredUsersModelWrapper(
//                        text: data.text,
//                        registered: data.registered,
//                        registeredType: []
//                    )
//                }
//                return CheckRegisteredUsersModelWrapper(
//                    text: "",
//                    registered: false,
//                    registeredType: []
//                )
//
//            } catch {
//                throw NetworkRequestError.badRequest
//            }
//        }
//    )
//
////    static func convertRegisteredTypeAuthUseCase(type: KompasIdLibrary.RegisteredType) -> RegisteredTypeModelWrapper {
////        if type == KompasIdLibrary.RegisteredType.EMAIL.Type {
////            return .email
////        }
////            return .email
////        }
// }
