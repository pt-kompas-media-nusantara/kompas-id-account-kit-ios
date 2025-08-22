////
////  AppUtilitiesDependency.swift
////  kompasid
////
////  Created by kompasid on 23/04/25.
////
//
//import ComposableArchitecture
//import Foundation
//import KompasIdLibrary
//
//// MARK: - AppUtilitiesDependecy
//struct AppUtilitiesDependecy {
//    var checkForceUpdate: @Sendable () async throws -> (type: AppVersionUpdateType, minMaxVersion: MinMaxVersion)
//    var tapLaterOnForceUpdate: @Sendable (_ minVersion: String, _ maxVersion: String) async throws -> Void
//    var checkOSRecommendation: @Sendable () async throws -> OSRecommendation
//    var clickClosedOSRecommendation: @Sendable (_ minOS: String, _ recoOS: String) async throws -> Void
//}
//
//// MARK: - AppUtilitiesDependecyKey
//private enum AppUtilitiesDependecyKey: DependencyKey {
//    static var forceUpdateUseCase: ForceUpdateUseCase = KoinInjector().forceUpdateUseCase
//    static var osRecommendationUseCase: KompasIdLibrary.OSRecomendationUseCase = KoinInjector().osRecomendationUseCase
//
//    static let liveValue = AppUtilitiesDependecy(
//        checkForceUpdate: {
//            do {
//                let result = try await forceUpdateUseCase.forceUpdate()
//                if let success = result as? ResultsSuccess<ForceUpdateInterceptor> {
//                    // success.value is your ForceUpdateInterceptor
//                    let type = success.data?.type
//                    let versionInfo = success.data?.versionInfo
//                    print("❤️ \(type) - \(versionInfo)")
//
//                    return (AppVersionUpdateType.kmpValueMapper(type: type ?? .noUpdate), MinMaxVersion(min: versionInfo?.minVersion ?? "", max: versionInfo?.maxVersion ?? ""))
//                    // → use your interceptor
//                } else if let failure = result as? ResultsError<NetworkError> {
//                    // failure.error is your NetworkError
//                    let networkError = failure.error
//                    // → handle error
//                    throw NetworkRequestError.badRequest
//                }
//
//            } catch {
//                // this catches any thrown Kotlin exceptions (CancellationException, etc.)
//                throw error
//            }
//
//            throw NetworkRequestError.badRequest // Fix Error Handler
//        },
//        tapLaterOnForceUpdate: { min, max in
//            do {
//                // Timing Munculnya yg harus di set
//                try await forceUpdateUseCase.updateLater(minVersion: min, maxVersion: max)
//            } catch {
//                throw error
//            }
//        },
//        checkOSRecommendation: {
//            do {
//                let result = try await osRecommendationUseCase.osRecommendation()
//                if let success = result as? ResultsSuccess<OSRecommendationInterceptor> {
//                    // success.value is your ForceUpdateInterceptor
//                    let title = success.data?.title
//                    let description = success.data?.descriptiion
//                    let minOS = success.data?.minOS
//                    let recoOS = success.data?.recoOS
//                    let type = success.data?.type
//
//                    print("❤️ \(success.data)")
//
//                    return OSRecommendation(
//                        title: title ?? "",
//                        description: description ?? "",
//                        minOS: minOS ?? "",
//                        recoOS: recoOS ?? "",
//                        type: OSRecommendationType_.kmpValueMapper(type: type ?? .noUpdateOs)
//                    )
//                    // → use your interceptor
//                } else if let failure = result as? ResultsError<NetworkError> {
//                    // failure.error is your NetworkError
//                    let networkError = failure.error
//                    // → handle error
//                    throw NetworkRequestError.badRequest
//                }
//
//            } catch {
//                throw error
//            }
//
//            throw NetworkRequestError.badRequest // Fix Error Handler
//        }, clickClosedOSRecommendation: { minOS, recoOS in
//            do {
//                // Timing Munculnya yg harus di set
//                try await osRecommendationUseCase.closeClick(minOS: minOS, recoOS: recoOS)
//            } catch {
//                throw error
//            }
//        }
//    )
//}
//
//extension DependencyValues {
//    var appUtilitiesDependency: AppUtilitiesDependecy {
//        get { self[AppUtilitiesDependecyKey.self] }
//        set { self[AppUtilitiesDependecyKey.self] = newValue }
//    }
//}
