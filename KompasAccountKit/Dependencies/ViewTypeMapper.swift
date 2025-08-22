////
////  ViewTypeMapper.swift
////  kompasid
////
////  Created by Kompas Digital on 19/02/25.
////
//
//import ComposableArchitecture
//import Foundation
//
//// MARK: - ViewTypeMapper
//struct ViewTypeMapper {
//    var convertKeyOf: @Sendable (String) -> PageType
//}
//
//// MARK: - AccountMenuMapperKey
//private enum AccountMenuMapperKey: DependencyKey {
//    static let liveValue = ViewTypeMapper(
//        convertKeyOf: { key in
//            switch key {
//            case "LOGIN": return .login
//            case "MANAGE_ACCOUNT": return .manageAccount
//            case "SUBSCRIPTION": return .subscription
//            case "BOOKMARK": return .bookmark
//            case "REWARD": return .webView(title: "Reward", url: "https://reward.kompas.id/")
//            case "SETTINGS": return .settings
//            case "CONTACT_US": return .contactUs
//            case "QNA": return .questionAnswer
//            case "ABOUT_APP": return .aboutApplication
//            case "ABOUT_HARIAN_KOMPAS": return .aboutKompasDaily
//            case "THEME": return .theme
//            case "CHANGE_PASSWORD": return .changePassword
//            case "DELETE_DATA": return .deleteData
//            case "DEVICE_ACTIVITIES": return .deviceActivity
//            case "DELETE_ACCOUNT": return .signOut
//            case "SIGN_OUT": return .signOut
//
//            case "ABOUT_APP_SUBMENU": return .aboutApplicationDetail
//            case "TERMS_CONDITIONS": return .webView(title: "Syarat dan Ketentuan", url: "https://www.kompas.id/syarat-dan-ketentuan/")
//            case "CYBER_MEDIA_GUIDELINES": return .webView(title: "Pedoman media siber", url: "https://www.kompas.id/pedoman-media-siber/")
//
//            case "COMPANY_PROFILE": return .webView(title: "Profile Perusahaan", url: "https://korporasi.kompas.id/")
//            case "COMPANY_HISTORY": return .webView(title: "Sejarah Perusahaan", url: "https://korporasi.kompas.id/profil/cerita-berdiri/")
//            case "ABOUT_ORGANIZATION": return .webView(title: "Tentang Organisasi", url: "https://www.kompas.id/organisasi/")
//
//            default: return .none
//            }
//        }
//    )
//}
//
//extension DependencyValues {
//    var viewTypeMapper: ViewTypeMapper {
//        get { self[AccountMenuMapperKey.self] }
//        set { self[AccountMenuMapperKey.self] = newValue }
//    }
//}
