////
////  SettingsManagerDependecy.swift
////  kompasid
////
////  Created by kompasid on 19/03/25.
////
//
//import ComposableArchitecture
//import Foundation
//import KompasIdLibrary
//
//// MARK: - SettingsDependecy
//struct SettingsDependecy {
//    var getString: @Sendable (StringKeySettingsType) async throws -> String
//}
//
//// MARK: - SettingsDependecyKey
//private enum SettingsDependecyKey: DependencyKey {
//    static var settingsUseCase: SettingsHelper = KoinInjector().settingsHelper
//    static let liveValue = SettingsDependecy(
//        getString: { _ in
////            let result = try await settingsUseCase.
//            ""
//        }
//    )
//}
//
//extension DependencyValues {
//    var settingsDependency: SettingsDependecy {
//        get { self[SettingsDependecyKey.self] }
//        set { self[SettingsDependecyKey.self] = newValue }
//    }
//}
