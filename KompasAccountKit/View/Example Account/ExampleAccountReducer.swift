//
//  ExampleAccountReducer.swift
//  kompasid
//
//  Created by Kompas Digital on 18/05/25.
//

import ComposableArchitecture

@Reducer struct ExampleAccountReducer {
    @ObservableState struct State: Equatable {
        var idLoading = false
    }

    enum Action {
        case examplePush
        case dismiss
    }

    @Dependency(\.dismiss) var dismiss

    var body: some Reducer<State, Action> {
        Reduce { _, action in
            switch action {
            case .examplePush:
                return .none
            case .dismiss:
                return .run { _ in
                    await self.dismiss()
                }
            }
        }
    }
}
