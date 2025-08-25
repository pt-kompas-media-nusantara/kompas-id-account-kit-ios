//
//  PersonalInfoDependency.swift
//  kompasid
//
//  Created by Harian Kompas on 07/03/25.
//

import ComposableArchitecture
import Foundation
import KompasIdLibrary

// MARK: - PersonalInfoDependency
@DependencyClient struct PersonalInfoDependency {
    var getUserDetailsAndMembership: @Sendable () async throws -> Void
//    var userDetail: @Sendable () async throws -> Void
    var userDetail: @Sendable () async throws -> UserDetailModelWrapper
    var userMembership: @Sendable () async throws -> Void
//    var getUserDetailsAndMembership: @Sendable () async throws -> UserDetailsAndMembershipModelWrapper
    
//    var userMembership: @Sendable () async throws -> UserMembershipModelWrapper
}

extension DependencyValues {
    var personalInfoDependency: PersonalInfoDependency {
        get { self[PersonalInfoDependency.self] }
        set { self[PersonalInfoDependency.self] = newValue }
    }
}

// MARK: - PersonalInfoDependency + DependencyKey
extension PersonalInfoDependency: DependencyKey {
    static let personalInfoUseCase: PersonalInfoUseCase = KoinInjector().personalInfoUseCase
    

    static var liveValue: Self {
        return Self(
            getUserDetailsAndMembership: {
                let result = try await personalInfoUseCase.getUserDetailsAndMembership()
                switch result {
                case let success as ResultsSuccess<UserDetailsAndMembershipResInterceptor>:
                    guard let data = success.data else {
                        throw ApiServicesError.unknown(message: "Error : ResultsSuccess<UserDetailsAndMembershipResInterceptor>")
                    }
                    print("\(data)")

                case let error as ResultsError<NetworkError>:
                    throw ApiErrorMapper.map(error)

                default:
                    throw ApiServicesError.unknown(message: "Error: getUserDetailsAndMembership")
                }
            },
            userDetail: {
                let result = try await personalInfoUseCase.userDetail()
                switch result {
                case let success as ResultsSuccess<UserDetailResInterceptor>:
                    guard let data = success.data else {
                        throw ApiServicesError.unknown(message: "Error : ResultsSuccess<UserDetailResInterceptor>")
                    }
                    let model = UserDetailModelWrapper(
                        idGender: Int(data.idGender),
                        gender: data.gender,
                        firstName: data.firstName,
                        lastName: data.lastName,
                        email: data.email,
                        userGuid: data.userGuid,
                        userStatus:
                            UserStatusModelWrapper(
                                isVerified: data.userStatus.isVerified,
                                phoneVerified: data.userStatus.phoneVerified
                            ),
                        phoneNumber: data.phoneNumber,
                        countryCode: data.countryCode,
                        dateBirth: data.dateBirth,
                        country: data.country,
                        province: data.province,
                        city: data.city
                    )
                    return model
                case let error as ResultsError<NetworkError>:
                    throw ApiErrorMapper.map(error)

                default:
                    throw ApiServicesError.unknown(message: "Error: userDetail")
                }
            },
            userMembership: {
                let result = try await personalInfoUseCase.userMembership()
                switch result {
                case let success as ResultsSuccess<UserMembershipResInterceptor>:
                    guard let data = success.data else {
                        throw ApiServicesError.unknown(message: "Error : ResultsSuccess<UserMembershipResInterceptor>")
                    }
                    print("\(data)")

                case let error as ResultsError<NetworkError>:
                    throw ApiErrorMapper.map(error)

                default:
                    throw ApiServicesError.unknown(message: "Error: userMembership")
                }
            }
        )
    }

    static let testValue = Self(
        getUserDetailsAndMembership: {},
        userDetail: {
            UserDetailModelWrapper(
                idGender: 0,
                gender: "data.gender",
                firstName: "data.firstName",
                lastName: "data.lastName",
                email: "data.email",
                userGuid: "data.userGuid",
                userStatus:
                    UserStatusModelWrapper(
                        isVerified: false,
                        phoneVerified: false
                    ),
                phoneNumber: "data.phoneNumber",
                countryCode: "data.countryCode",
                dateBirth: "data.dateBirth",
                country: "data.country",
                province: "data.province",
                city: "data.city"
            )
        },
        userMembership: {}
    )

}
