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
    var getUserDetailsAndMembership: @Sendable () async throws -> UserDetailsAndMembershipModelWrapper
    var userDetail: @Sendable () async throws -> UserDetailModelWrapper
    var userMembership: @Sendable () async throws -> UserMembershipModelWrapper
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
                    
                    let model = UserDetailsAndMembershipModelWrapper(
                        userDetail: UserDetailModelWrapper(
                            idGender: Int(data.userDetail.idGender),
                            gender: data.userDetail.gender,
                            firstName: data.userDetail.firstName,
                            lastName: data.userDetail.lastName,
                            email: data.userDetail.email,
                            userGuid: data.userDetail.userGuid,
                            userStatus:
                                UserStatusModelWrapper(
                                    isVerified: data.userDetail.userStatus.isVerified,
                                    phoneVerified: data.userDetail.userStatus.phoneVerified
                                ),
                            phoneNumber: data.userDetail.phoneNumber,
                            countryCode: data.userDetail.countryCode,
                            dateBirth: data.userDetail.dateBirth,
                            country: data.userDetail.country,
                            province: data.userDetail.province,
                            city: data.userDetail.city
                        ),
                        userMembership: UserMembershipModelWrapper(
                            status: data.userMembership.status,
                            duration: data.userMembership.duration,
                            startDate: data.userMembership.startDate,
                            endDate: data.userMembership.endDate,
                            gracePeriod: data.userMembership.gracePeriod,
                            gracePeriodDate: data.userMembership.gracePeriodDate,
                            totalGracePeriod: Int(data.userMembership.totalGracePeriod),
                            membership: data.userMembership.membership,
                            entitlement: data.userMembership.entitlement
                        ),
                        userHistoryMembership:
                            UserHistoryMembershipModelWrapper(
                            active: [],
                            canceled: [],
                            expired: [],
                            gracePeriod: [])
                    )

                    return model
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

                    let model = UserMembershipModelWrapper(
                        status: data.status,
                        duration: data.duration,
                        startDate: data.startDate,
                        endDate: data.endDate,
                        gracePeriod: data.gracePeriod,
                        gracePeriodDate: data.gracePeriodDate,
                        totalGracePeriod: Int(data.totalGracePeriod),
                        membership: data.membership,
                        entitlement: data.entitlement
                    )
                    return model
                case let error as ResultsError<NetworkError>:
                    throw ApiErrorMapper.map(error)

                default:
                    throw ApiServicesError.unknown(message: "Error: userMembership")
                }
            }
        )
    }

    static let testValue = Self(
        getUserDetailsAndMembership: {
            UserDetailsAndMembershipModelWrapper(
                userDetail: UserDetailModelWrapper(
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
                ),
                userMembership: UserMembershipModelWrapper(
                    status: "data.statust",
                    duration: "data.durationt",
                    startDate: "data.startDatet",
                    endDate: "data.endDatet",
                    gracePeriod: false,
                    gracePeriodDate: "data.gracePeriodDatet",
                    totalGracePeriod: 0,
                    membership: "data.membershipt",
                    entitlement: "data.entitlement"
                ),
                userHistoryMembership:
                    UserHistoryMembershipModelWrapper(
                    active: [],
                    canceled: [],
                    expired: [],
                    gracePeriod: [])
            )
        },
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
        userMembership: {
            UserMembershipModelWrapper(
                status: "data.statust",
                duration: "data.durationt",
                startDate: "data.startDatet",
                endDate: "data.endDatet",
                gracePeriod: false,
                gracePeriodDate: "data.gracePeriodDatet",
                totalGracePeriod: 0,
                membership: "data.membershipt",
                entitlement: "data.entitlement"
            )
        }
    )

}
