//
//  StoreContainer.swift
//  kompasid
//
//  Created by Kompas Digital on 14/05/25.
//

import ComposableArchitecture
import SwiftUI

// MARK: - StoreContainer
/// This wrapper provides an "entry" point into an individual StoreContainer that can own a store.
struct StoreContainer<State, Action, Content: View>: View {
    init(
        store: Store<State, Action>,
        @ViewBuilder content: @escaping (Store<State, Action>) -> Content
    ) {
        self.store = store
        self.content = content
    }

    @SwiftUI.State var store: Store<State, Action>
    let content: (Store<State, Action>) -> Content

    var body: some View {
        WithPerceptionTracking {
            self.content(self.store)
        }
    }
}
