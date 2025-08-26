//
//  UserHistoryMembershipModelWrapper.swift
//  KompasAccountKit
//
//  Created by Kompas Digital on 26/08/25.
//

import Foundation

struct UserHistoryMembershipModelWrapper {
    let active: [MembershipInfoInterceptor]
    let canceled: [MembershipInfoInterceptor]
    let expired: [MembershipInfoInterceptor]
    let gracePeriod: [MembershipInfoInterceptor]
}

struct MembershipInfoInterceptor {
    let endDate: String
    let membershipSlug: String
    let membershipTitle: String
    let startDate: String
}

