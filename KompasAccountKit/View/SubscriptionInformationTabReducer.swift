//
//  SubscriptionInformationTabReducer.swift
//  kompasid
//
//  Created by Kompas Digital on 25/05/25.

// https://apisubs.kompas.id/subscriptions -> satuan membership
// https://apisubs.kompas.id/membership -> history membership

import ComposableArchitecture

@Reducer struct SubscriptionInformationTabReducer {
    @ObservableState struct State: Equatable {
        var idLoading = false
    }

    enum Action {
        case onAppear
        
        case userMembershipAndSubscriptionResponse(Result<Void, any Error>)
    }
    
    @Dependency(\.personalInfoDependency) var personalInfoDependency

    var body: some Reducer<State, Action> {
        Reduce { _, action in
            switch action {
            case .onAppear:
                return .run { send in
                    await send(.userMembershipAndSubscriptionResponse(Result {
                        try await self.personalInfoDependency.getUserDetailsAndMembership()
                    }))
                }
                .cancellable(id: CancelID.getUserDetailsAndMembership)
            case let .userMembershipAndSubscriptionResponse(.success(response)):
                print("\(response)")
                return .none
            case let .userMembershipAndSubscriptionResponse(.failure(error)):
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
//case .advanceAgeAndMoodAfterDelay:
//  return .run { [state] send in
//    try await self.mainQueue.sleep(for: .seconds(1))
//    async let changeAge: () = send(.changeAge(state.age + 1))
//    async let changeMood: () = send(.changeMood(state.mood + 1))
//    _ = await (changeAge, changeMood)
//  }
