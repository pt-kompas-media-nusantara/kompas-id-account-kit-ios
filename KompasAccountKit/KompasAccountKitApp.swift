//
//  KompasAccountKitApp.swift
//  KompasAccountKit
//
//  Created by Kompas Digital on 15/08/25.
//

import SwiftUI
import KompasIdLibrary
import ComposableArchitecture

@main
struct KompasAccountKitApp: App {
    
    init() {
        KompasIdLibrary.KoinInitializerKt.doInitKoin()
    }
    
    var body: some Scene {
        WindowGroup {
            StoreContainer(
                store: Store(
                    initialState: CoordinatorReducer.State(),
                    reducer: {
                        CoordinatorReducer()
                    }
                )) { store in
                    CoordinatorView(store: store)
                }
        }
    }
}
