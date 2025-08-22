////
////  QuestionAnswerDependency.swift
////  kompasid
////
////  Created by Kompas Digital on 26/02/25.
////
//
//import ComposableArchitecture
//import Foundation
//
//// MARK: - QuestionAnswerDependency
//struct QuestionAnswerDependency {
//    var get: @Sendable () async throws -> [QuestionAnswerModel]
//}
//
//// MARK: - QuestionAnswerDependencyKey
//private enum QuestionAnswerDependencyKey: DependencyKey {
//    static let liveValue = QuestionAnswerDependency(
//        get: {
//            // Hit KMP Here
//            DataAdapters.questionAnswer(datas: DummyData.questionAnswer())
//        }
//    )
//}
//
//extension DependencyValues {
//    var questionAnswerDependency: QuestionAnswerDependency {
//        get { self[QuestionAnswerDependencyKey.self] }
//        set { self[QuestionAnswerDependencyKey.self] = newValue }
//    }
//}
