////
////  UserMembershipDependency.swift
////  kompasid
////
////  Created by Harian Kompas on 06/03/25.
////
//
//import ComposableArchitecture
//import Foundation
//
//// MARK: - UserMembershipDependency
//struct UserMembershipDependency {
//    var getAllMembership: @Sendable () async throws -> MembershipModel
//}
//
//// MARK: - UserMembershipDependencyKey
//private enum UserMembershipDependencyKey: DependencyKey {
//    static let liveValue = UserMembershipDependency(
//        getAllMembership: {
//            // Hit KMP Here
//            MembershipModel(membershipResponse: DummyData.membershipResponse())
//        }
//    )
//}
//
//extension DependencyValues {
//    var userMembershipDependency: UserMembershipDependency {
//        get { self[UserMembershipDependencyKey.self] }
//        set { self[UserMembershipDependencyKey.self] = newValue }
//    }
//}
