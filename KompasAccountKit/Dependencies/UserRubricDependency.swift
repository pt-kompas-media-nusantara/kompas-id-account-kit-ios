////
////  UserRubricDependency.swift
////  kompasid
////
////  Created by Harian Kompas on 06/03/25.
////
//
//import ComposableArchitecture
//import Foundation
//
//// MARK: - UserRubricDependency
//struct UserRubricDependency {
////    var getPilihanku: @Sendable () async throws -> [PilihankuOfferStateModel]
//}
//
//// MARK: - UserRubricDependencyKey
//private enum UserRubricDependencyKey: DependencyKey {
//    static let liveValue = UserRubricDependency(
//        getPilihanku: {
//            // Hit KMP Here
//            do {
//                let response = try JsonParser.decode(RubricPilihankuResponse.self, fileResponseName: "Pilihanku_200")
//                var result: [PilihankuOfferStateModel] = []
//                if let resultTemp = response.data {
//                    for item in resultTemp {
//                        result.append(.init(from: item))
//                    }
//                }
//
//                return result
//            } catch {
//                print("🟥 \(error)")
//            }
//
//            return []
//        }
//    )
//}
//
//extension DependencyValues {
//    var userRubricDependency: UserRubricDependency {
//        get { self[UserRubricDependencyKey.self] }
//        set { self[UserRubricDependencyKey.self] = newValue }
//    }
//}
