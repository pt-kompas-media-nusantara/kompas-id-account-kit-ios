//
//  KompasAccountKitApp.swift
//  KompasAccountKit
//
//  Created by Kompas Digital on 15/08/25.
//

import SwiftUI
import KompasIdLibrary

@main
struct KompasAccountKitApp: App {
    
    init() {
        KompasIdLibrary.KoinInitializerKt.doInitKoin()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
