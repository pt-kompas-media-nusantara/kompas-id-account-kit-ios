////
////  ArticleListDependecy.swift
////  kompasid
////
////  Created by Kompas Digital on 28/02/25.
////
//
//import ComposableArchitecture
//import Foundation
//
//// MARK: - ArticleListDependecy
//struct ArticleListDependecy {
//    var bookmarks: @Sendable () async throws -> [BookmarkCardthum]
//}
//
//// MARK: - ArticleListDependecyKey
//private enum ArticleListDependecyKey: DependencyKey {
//    static let liveValue = ArticleListDependecy(
//        bookmarks: {
//            DataAdapters.bookmarkList(datas: DummyData.bookmarkList())
//        })
//}
//
//extension DependencyValues {
//    var articleListDependecy: ArticleListDependecy {
//        get { self[ArticleListDependecyKey.self] }
//        set { self[ArticleListDependecyKey.self] = newValue }
//    }
//}
