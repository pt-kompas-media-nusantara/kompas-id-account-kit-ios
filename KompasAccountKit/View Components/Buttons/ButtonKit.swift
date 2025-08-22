//
//  ButtonKit.swift
//  KompasAccountKit
//
//  Created by Kompas Digital on 22/08/25.
//

import SwiftUI


struct ButtonKit: View {
    var text: String = ""
    var icon: String?
    var type: ButtonType = .defaultBlue
    var isDisable: Bool = false
    var height: CGFloat = 50
    var width: CGFloat? = nil
    var iconOnly: Bool = false
    var handler: () -> Void
    
    var body: some View {
        Button(
            action: { self.handler() },
            label: {
                HStack(alignment: .center, spacing: 12) {
                    // ICON
                    if let icon = self.icon {
                        Image(icon)
                            .foregroundColor(self.type.textColor())
                            .frame(width: 22, height: 22)
                    }
                    if !self.iconOnly {
                        // TEXT
                        Text(self.text)
                            .foregroundColor(self.isDisable ? Color.lightGrey40_surface30 : self.type.textColor())
                            .font(.custom(.fontHindSemibold, size: 17))
                    }
                }
                .frame(height: self.height, alignment: .center)
                .if(self.width != nil, if: {
                    $0.frame(minWidth: 0, maxWidth: self.width)
                }, else: {
                    $0.frame(minWidth: 0, maxWidth: .infinity)
                })
                
                .overlay(RoundedRectangle(cornerRadius: 4)
                    .stroke(self.isDisable ? Color.lightGrey30_white12.opacity(0) : self.type.borderColor(), lineWidth: 3)
                )
            }
        )
        .background(self.isDisable ? Color.lightGrey30_white12 : self.type.buttonColor())
        .cornerRadius(4)
        .disabled(self.isDisable)
    }
}
