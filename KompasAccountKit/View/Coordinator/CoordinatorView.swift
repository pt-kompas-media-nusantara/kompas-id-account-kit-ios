//
//  CoordinatorView.swift
//  kompasid
//
//  Created by Kompas Digital on 07/05/25.
//

import ComposableArchitecture
import SwiftUI

struct CoordinatorView: View {
    @Perception.Bindable var store: StoreOf<CoordinatorReducer>

    var body: some View {
        WithPerceptionTracking {
            NavigationStack(path: self.$store.scope(state: \.path, action: \.path)) {
                VStack {
                    Text("CoordinatorView by Nurirppan")
                }

            } destination: { store in
                WithPerceptionTracking {
                    switch store.case {
                    case let .examplePage(store):
                        ExampleAccountView(store: store)

                    }
                }
            }
        }
    }

}
