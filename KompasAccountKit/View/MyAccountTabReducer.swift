//
//  MyAccountTabReducer.swift
//  kompasid
//
//  Created by Kompas Digital on 25/05/25.
//

import ComposableArchitecture

@Reducer struct MyAccountTabReducer {
    @ObservableState struct State: Equatable {
        var isLoading = false
        var fullName = ""
        var gender = ""
        var dateOfBirth = ""
        var address = ""
        var email = ""
        var phoneNumber = ""
    }
    
    enum Action {
        case onAppear
        case onFullnameTapped
        case onGenderTapped
        case onDateOfBirthTapped
        case onAddressTapped
        case onAddEmailTapped
        case onAddPhoneNumberTapped
        
        case userDetailResponse(Result<UserDetailModelWrapper, any Error>)
    }
    
    @Dependency(\.personalInfoDependency) var personalInfoDependency
    private enum CancelID { case personalInfo }
    
    var body: some Reducer<State, Action> {
        Reduce { _, action in
            switch action {
            case .onFullnameTapped:
                return .none
            case .onGenderTapped:
                return .none
            case .onDateOfBirthTapped:
                return .none
            case .onAddressTapped:
                return .none
            case .onAddEmailTapped:
                return .none
            case .onAddPhoneNumberTapped:
                return .none
            case .onAppear:
                return .run { send in
                    await send(.userDetailResponse(Result {
                        try await self.personalInfoDependency.userDetail()
                    }))
                }
                .cancellable(id: CancelID.personalInfo)
            case let .userDetailResponse(.success(response)):
                print("\(response)")
                return .none
            case let .userDetailResponse(.failure(error)):
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
