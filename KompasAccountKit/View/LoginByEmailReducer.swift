//
//  LoginByEmailReducer.swift
//  kompasid
//
//  Created by Kompas Digital on 06/05/25.
//

import ComposableArchitecture

@Reducer struct LoginByEmailReducer {
    @ObservableState struct State: Equatable {
        var isLoading = false
        var email = "nur.irfan@kompas.com"
        var password = "Nurirppankompas@28"
    }
    
    enum Action {
        case loginButtonTapped
        case loginResponse(Result<Void, any Error>)
    }
    
    @Dependency(\.authUseCaseDependecy) var authUseCaseDependecy
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .loginButtonTapped:
                return .run { [email = state.email, password = state.password] send in
                    await send(.loginResponse(Result {
                        try await self.authUseCaseDependecy.loginByEmailAndFetchProfile(
                            email: email,
                            password: password
                        )
                    }))
                }
            case .loginResponse(.success):
                return .none
            case let .loginResponse(.failure(error)):
                if let apiError = error as? ApiServicesError {
                    switch apiError {
                    case .offline:
                        return .none
                    case .rto:
                        return .none
                    case .unauthorized:
                        return .none
                    case .error4xx(_, _):
                        return .none
                    case .error5xx(_, _):
                        return .none
                    case .unknown(_):
                        return .none
                    }
                } else {
                    Logger.debug("Unhandled error type: \(error.localizedDescription)")
                    return .none
                }
            }
        }
    }
}
