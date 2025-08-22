//
//  If+Extension.swift
//  If+Extension
//
//  Created by Nur Irfan Pangestu on 09/09/21.
//

import Foundation
import SwiftUI

// MARK: - Conditional View Modifiers
extension View {
    // MARK: - If view extension
    @ViewBuilder
    func `if`<Transform: View>(
        _ condition: Bool,
        transform: (Self) -> Transform
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    /*
     var body: some view {
       myView
         .if(X) { $0.padding(8) }
         .if(Y) { $0.background(Color.blue) }
     }
     */

    // MARK: - If else view extension
    @ViewBuilder
    func `if`<TrueContent: View, FalseContent: View>(
        _ condition: Bool,
        if ifTransform: (Self) -> TrueContent,
        else elseTransform: (Self) -> FalseContent
    ) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }

    // MARK: - If else view extension (tapi ini bisa if else lagi di dalem closure nya)
    /**
     When you use an if-else statement inside the elseTransform closure, the compiler needs to see a single consistent type of view. To handle this, you can use the @ViewBuilder to create a composite view that includes conditional views.
     */
    @ViewBuilder
    func `if`<TrueContent: View, FalseContent: View>(
        _ condition: Bool,
        @ViewBuilder transform: (Self) -> TrueContent,
        @ViewBuilder elseTransform: (Self) -> FalseContent
    ) -> some View {
        if condition {
            transform(self)
        } else {
            elseTransform(self)
        }
    }

    /*
     var body: some view {
       myView
         .if(X) { $0.padding(8) } else: { $0.background(Color.blue) }
     }
     */

    // MARK: - IfLet view extension
    @ViewBuilder
    func ifLet<V, Transform: View>(
        _ value: V?,
        transform: (Self, V) -> Transform
    ) -> some View {
        if let value = value {
            transform(self, value)
        } else {
            self
        }
    }

    /*
     var body: some view {
       myView
         .ifLet(optionalColor) { $0.foregroundColor($1) }
     }
     */

    @ViewBuilder
    func ifIpad<Transform: View>(transform: (Self) -> Transform) -> some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder
    func ifIpad<TrueContent: View, FalseContent: View>(true trueTransform: (Self) -> TrueContent, false falseTransform: (Self) -> FalseContent) -> some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            trueTransform(self)
        } else {
            falseTransform(self)
        }
    }

    func modify<Content: View>(
        @ViewBuilder _ transform: (Self) -> Content
    ) -> some View {
        return transform(self)
    }
}
