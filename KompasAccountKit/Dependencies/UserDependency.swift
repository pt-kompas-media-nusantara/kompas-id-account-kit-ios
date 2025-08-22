////
////  UserDependency.swift
////  kompasid
////
////  Created by Harian Kompas on 07/03/25.
////
//
//import ComposableArchitecture
//import Foundation
//import KompasIdLibrary
//
//// MARK: - UserDependency
//struct UserDependency {
//    /// Ganti user detail data name jd pakai wrapper
//    var getDetail: @Sendable () async throws -> UserDetailData?
//}
//
//// MARK: - UserDependencyKey
//private enum UserDependencyKey: DependencyKey {
//    static var personalInfoUseCase: PersonalInfoUseCase = KoinInjector().personalInfoUseCase
//    static let liveValue = UserDependency(
//        getDetail: {
//            // Hit KMP Here
//            var userDetail: UserDetailData?
////            do {
////                let result = try await personalInfoUseCase.userDetail()
////
////                if let successResult = result as? ResultsSuccess<UserDetailResInterceptor> {
////                    userDetail = UserDetailData(
////                        userID: successResult.data?.userId,
////                        firstName: successResult.data?.firstName,
////                        lastName: successResult.data?.lastName,
////                        email: successResult.data?.email,
////                        userGUID: successResult.data?.userGuid,
////                        isActive: successResult.data?.isActive,
////                        userStatus: UserStatus(
////                            isVerified: successResult.data?.userStatus.isVerified,
////                            clickDate: nil
////                        ),
////                        phoneNumber: successResult.data?.phoneNumber,
////                        dateBirth: successResult.data?.dateBirth,
////                        country: successResult.data?.country,
////                        countryCode: successResult.data?.countryCode,
////                        gender: Int(successResult.data?.gender ?? ""),
////                        province: successResult.data?.province,
////                        city: successResult.data?.city
////                    )
////                }
////            } catch {
////                throw NetworkRequestError.badRequest
////            }
//
//            return userDetail
//        }
//    )
//}
//
//extension DependencyValues {
//    var userDependency: UserDependency {
//        get { self[UserDependencyKey.self] }
//        set { self[UserDependencyKey.self] = newValue }
//    }
//}
