//
//  SSOAppleModel.swift
//  kompasid
//
//  Created by Kompas Digital on 08/05/25.
//

import Foundation

struct SSOAppleModel: Equatable {
    let user: String
    let state: String
    let authorizationCode: String
    let identityToken: String
    let email: String
    let namePrefix: String
    let givenName: String
    let middleName: String
    let familyName: String
    let nameSuffix: String
    let nickname: String
    let realUserStatus: Int
}

/**
 ini output model di atas
 (lldb) po result
 ▿ SSOAppleModel
   - user : "000666.817cba4bab5144aeb0b29d91a8e24b99.0722"
   - state : ""
   - authorizationCode : "Optional(63 bytes)"
   - identityToken : "Optional(768 bytes)"
   - email : ""
   - namePrefix : ""
   - givenName : ""
   - middleName : ""
   - familyName : ""
   - nameSuffix : ""
   - nickname : ""
   - realUserStatus : 1
 */
