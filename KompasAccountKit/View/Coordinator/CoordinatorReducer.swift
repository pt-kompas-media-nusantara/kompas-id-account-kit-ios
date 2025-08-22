//
//  CoordinatorReducer.swift
//  kompasid
//
//  Created by Kompas Digital on 14/05/25.
//

import ComposableArchitecture

// MARK: - CoordinatorReducer
@Reducer struct CoordinatorReducer {
    
    @Reducer enum Path {
        case examplePage(ExampleAccountReducer)
        
    }
        
    @ObservableState struct State: Equatable {
        var path = StackState<Path.State>()
    }
    
    // MARK: - Action
    
    enum Action {
        case goBackToPage(id: StackElementID)
        case goToDestinationPage
        case path(StackActionOf<Path>)
        case popToRoot
        
    }
    
    // MARK: - Reducer Body
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                // MARK: - Basic Navigation
                
            case .goBackToPage(let id):
                state.path.pop(to: id)
                return .none
                
            case .popToRoot:
                state.path.removeAll()
                return .none
                
            case .goToDestinationPage:
                return .none
                
            case let .path(.element(_, actionPathChild)):
                switch actionPathChild {
                case .examplePage(.examplePush):
                    state.path.append(.examplePage(ExampleAccountReducer.State()))
                    return .none
                    
                default:
                    return .none
                }
                
            case .path:
                return .none
                
            }
        }
        .forEach(\.path, action: \.path)
    }
}

// MARK: - Equatable Conformance

extension CoordinatorReducer.Path.State: Equatable {}
