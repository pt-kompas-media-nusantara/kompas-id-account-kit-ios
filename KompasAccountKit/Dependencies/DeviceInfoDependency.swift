////
////  DeviceInfoDependency.swift
////  kompasid
////
////  Created by Kompas Digital on 26/02/25.
////
//
//import ComposableArchitecture
//import Foundation
//
//// MARK: - DeviceInfoDependency
//struct DeviceInfoDependency {
//    var get: @Sendable () async throws -> [DeviceInfoDetail]
//}
//
//// MARK: - DeviceInfoDependencyKey
//private enum DeviceInfoDependencyKey: DependencyKey {
//    static let liveValue = DeviceInfoDependency(
//        get: {
//            // Hit KMP Here
//            DataAdapters.deviceInfo(datas: DummyData.deviceInfo())
//        }
//    )
//}
//
//extension DependencyValues {
//    var deviceInfoDependency: DeviceInfoDependency {
//        get { self[DeviceInfoDependencyKey.self] }
//        set { self[DeviceInfoDependencyKey.self] = newValue }
//    }
//}
