////
////  UseCaseInjectorDependency.swift
////  kompasid
////
////  Created by Kompas Digital on 18/02/25.
////
//
//import ComposableArchitecture
//import Foundation
//import KompasIdLibrary
//
//// MARK: - CancelID
//enum CancelID {
//    case menus
//    case login
//}
//
//// MARK: - UseCaseInjector
//struct UseCaseInjector {
//    var fetchAccountMenu: @Sendable () async throws -> [AccountModelWrapper]
//    var fetchSettingsMenu: @Sendable () async throws -> [AccountModelWrapper]
//    var fetchAboutApplicationMenu: @Sendable () async throws -> [AccountModelWrapper]
//    var fetchAboutKompasDailyMenu: @Sendable () async throws -> [AccountModelWrapper]
//}
//
//// MARK: - UseCaseInjectorKey
//private enum UseCaseInjectorKey: DependencyKey {
//    static var myAccount: AccountUseCase = KoinInjector().accountUseCase
//
//    static let liveValue = UseCaseInjector(
//        fetchAccountMenu: {
//            let data = try await myAccount.accountMenus()
//            print("🔥 \(data)")
//            return data.map {
//                AccountModelWrapper(
//                    menuIcon: $0.menuIcon,
//                    title: $0.title,
//                    desc: $0.desc,
//                    navigation: $0.navigation.value
//                )
//            }
////            var accountModels: [AccountModelWrapper] = []
////            data.enumerated().forEach { index, value in
////                accountModels.append(
////                    AccountModelWrapper(
////                        menuIcon: value.menuIcon,
////                        title: value.title,
////                        desc: value.desc,
////                        navigation: value.navigation.value
////                    )
////                )
////
////                if index == 1 {
////                    accountModels.append(
////                        AccountModelWrapper(
////                            menuIcon: "icSubscriptionData",
////                            title: "Berlangganan",
////                            desc: "Lihat tawaran berlangganan Kompas.id",
////                            navigation: "SUBSCRIPTION"
////                        )
////                    )
////                }
////            }
////
////            return accountModels
//        },
//        fetchSettingsMenu: {
//            let data = try await myAccount.settingMenus()
//            return data.map {
//                AccountModelWrapper(
//                    menuIcon: $0.menuIcon,
//                    title: $0.title,
//                    desc: $0.desc,
//                    navigation: $0.navigation.value
//                )
//            }
//        },
//        fetchAboutApplicationMenu: {
//            let data = try await myAccount.aboutAppMenus()
//            return data.map {
//                AccountModelWrapper(
//                    menuIcon: $0.menuIcon,
//                    title: $0.title,
//                    desc: $0.desc,
//                    navigation: $0.navigation.value
//                )
//            }
//        },
//        fetchAboutKompasDailyMenu: {
//            let data = try await myAccount.aboutHarianKompasMenus()
//            return data.map {
//                AccountModelWrapper(
//                    menuIcon: $0.menuIcon,
//                    title: $0.title,
//                    desc: $0.desc,
//                    navigation: $0.navigation.value
//                )
//            }
//        }
//    )
//}
//
//extension DependencyValues {
//    var useCaseInjector: UseCaseInjector {
//        get { self[UseCaseInjectorKey.self] }
//        set { self[UseCaseInjectorKey.self] = newValue }
//    }
//}
