////
////  SubscriptionDependency.swift
////  kompasid
////
////  Created by Harian Kompas on 06/03/25.
////
//
//import ComposableArchitecture
//import Foundation
//
//// MARK: - SubscriptionDependency
//struct SubscriptionDependency {
//    var getLandingData: @Sendable () async throws -> SubscriptionLanding?
//}
//
//// MARK: - SubscriptionDependencyKey
//private enum SubscriptionDependencyKey: DependencyKey {
//    static let liveValue = SubscriptionDependency(
//        getLandingData: {
//            // Hit KMP Here
//            do {
//                let response = try JsonParser.decode(LandingPageSubsResponse.self, fileResponseName: "LandingPageSubscription_200")
//                return SubscriptionLanding(
//                    headerImage: response.result.headerImage,
//                    title: response.result.title,
//                    content: response.result.content,
//                    aboutQuit: response.result.aboutQuit,
//                    aboutSubscription: response.result.aboutSubscription,
//                    termCondition: response.result.termCondition,
//                    privacyPolicy: response.result.privacyPolicy,
//                    paymentTransaction: response.result.paymentTransaction
//                )
//            } catch {
//                print("🟥 \(error.localizedDescription)")
//            }
//
//            return nil
//        }
//    )
//}
//
//extension DependencyValues {
//    var subscriptionDependency: SubscriptionDependency {
//        get { self[SubscriptionDependencyKey.self] }
//        set { self[SubscriptionDependencyKey.self] = newValue }
//    }
//}
