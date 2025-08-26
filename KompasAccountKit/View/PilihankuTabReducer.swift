//
//  PilihankuTabReducer.swift
//  kompasid
//
//  Created by Kompas Digital on 25/05/25.
//

import ComposableArchitecture

@Reducer struct PilihankuTabReducer {
    @ObservableState struct State: Equatable {
        var idLoading = false
    }

    enum Action {
        case examplePush
    }

    var body: some Reducer<State, Action> {
        Reduce { _, action in
            switch action {
            case .examplePush:
                return .none
            }
        }
    }
}
