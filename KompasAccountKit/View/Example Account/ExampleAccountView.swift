//
//  ExampleAccountView.swift
//  kompasid
//
//  Created by Kompas Digital on 18/05/25.
//

import ComposableArchitecture
import SwiftUI

struct ExampleAccountView: View {
    @Perception.Bindable var store: StoreOf<ExampleAccountReducer>

    var body: some View {
        WithPerceptionTracking {
            VStack {
                Text("ExampleAccountView")
                    .padding(.vertical, 8)

            }
        }
    }
}
