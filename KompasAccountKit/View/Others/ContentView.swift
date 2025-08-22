//
//  ContentView.swift
//  KompasAccountKit
//
//  Created by Kompas Digital on 15/08/25.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    @Perception.Bindable var store: StoreOf<LoginByEmailReducer>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Button("Login By Email") {
                    self.store.send(.loginButtonTapped)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

//#Preview {
//    ContentView()
//}


//VStack {
//    HStack(spacing: 0) {
//        VStack {
//            ZStack(alignment: .center) {
//                Circle()
//                    .frame(width: 44, height: 44)
//                    .foregroundColor(Color.royal60_blue30)
//                HStack(spacing: 0) {
//                    Text("N")
//                        .font(.custom(.fontHindRegular, size: 14))
//                        .foregroundColor(Color.white_surface00)
//                        .textCase(.uppercase)
//                    Text("P")
//                        .font(.custom(.fontHindRegular, size: 14))
//                        .foregroundColor(Color.white_surface00)
//                        .textCase(.uppercase)
//                }
//            }
//            Spacer()
//        }
//        .ifIpad(true: {
//            $0.padding(.trailing, 16)
//        }, false: {
//            $0.padding(.horizontal, 16)
//        })
//        
//        VStack(alignment: .leading, spacing: 4) {
//            Text("Nur Irfan")
//                .font(.custom(.fontHindSemibold, size: 18))
//                .foregroundColor(Color.lightGrey60_darkGrey10)
//                .multilineTextAlignment(.leading)
//            Text("nurirppan@gmail.com")
//                .font(.custom(.fontHindRegular, size: 14))
//                .foregroundColor(Color.lightGrey40_text70)
//                .multilineTextAlignment(.leading)
//            Text("Tidak Berlangganan")
//                .font(.custom(.fontHindRegular, size: 14))
//                .foregroundColor(Color.royal60_blue30)
//                .multilineTextAlignment(.leading)
//        }
//        Spacer()
//    }
//    .frame(height: 72, alignment: .center)
//    
//    Spacer()
//}
