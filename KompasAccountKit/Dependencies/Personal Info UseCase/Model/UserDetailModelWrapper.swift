//
//  UserDetailModelWrapper.swift
//  KompasAccountKit
//
//  Created by Kompas Digital on 22/08/25.
//


import Foundation

struct UserDetailModelWrapper {
    let idGender: Int
    let gender: String
    let firstName: String
    let lastName: String
    let email: String
    let userGuid: String
    let userStatus: UserStatusModelWrapper
    let phoneNumber: String
    let countryCode: String
    let dateBirth: String
    let country: String
    let province: String
    let city: String
}

struct UserStatusModelWrapper {
    let isVerified: Bool
    let phoneVerified: Bool
}

