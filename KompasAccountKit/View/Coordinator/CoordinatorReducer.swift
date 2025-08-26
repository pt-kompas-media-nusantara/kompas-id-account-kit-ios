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
        
        var loginByEmailState = LoginByEmailReducer.State()
        var myAccountTabState = MyAccountTabReducer.State()
        var subscriptionInformationTabState = SubscriptionInformationTabReducer.State()
    }
    
    // MARK: - Action
    
    enum Action {
        case goBackToPage(id: StackElementID)
        case goToDestinationPage
        case path(StackActionOf<Path>)
        case popToRoot
        
        case loginByEmailAction(LoginByEmailReducer.Action)
        case myAccountTabAction(MyAccountTabReducer.Action)
        case subscriptionInformationTabAction(SubscriptionInformationTabReducer.Action)
        
    }
    
    // MARK: - Reducer Body
    
    var body: some Reducer<State, Action> {
        Scope(state: \.loginByEmailState, action: \.loginByEmailAction) {
            LoginByEmailReducer()
        }
        Scope(state: \.myAccountTabState, action: \.myAccountTabAction) {
            MyAccountTabReducer()
        }
        Scope(state: \.subscriptionInformationTabState, action: \.subscriptionInformationTabAction) {
            SubscriptionInformationTabReducer()
        }
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
                
            case .loginByEmailAction(_):
                return .none
            case .myAccountTabAction(_):
                return .none
            case .subscriptionInformationTabAction(_):
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}

// MARK: - Equatable Conformance

extension CoordinatorReducer.Path.State: Equatable {}
