//
//  KompasButtonDetail.swift
//  Kompas.id
//
//  Created by TI Digital on 24/11/22.
//

import Foundation
import SwiftUI


// MARK: - ButtonType
enum ButtonType {
    case ssoGoogle
    case ssoApple
    case defaultBlue
    case defaultGreen
    case defaultWhite
    case borderedBlue
    case clear

    func buttonColor() -> Color {
        switch self {
        case .ssoGoogle:
            return .white
        case .ssoApple:
            return .black
        case .defaultBlue:
            return Color.royal60_blue30
        case .defaultGreen:
            return Color.green50_green30
        case .defaultWhite:
            return .white
        case .borderedBlue:
            return .clear
        case .clear:
            return .clear
        }
    }

    func textColor() -> Color {
        switch self {
        case .defaultWhite:
            return Color.royal60_royal60
        case .borderedBlue:
            return Color.royal60_blue30
        case .ssoApple:
            return .white
        case .defaultBlue, .defaultGreen:
            return Color.white_darkGrey70
        case .ssoGoogle:
            return Color.lightGrey50_lightGrey50
        case .clear:
            return Color.white
        }
    }

    func borderColor() -> Color {
        switch self {
        case .ssoGoogle:
            return Color.lightGrey50_darkGrey20
        case .ssoApple:
            return Color.clear
        case .defaultBlue, .borderedBlue:
            return Color.royal60_blue30
        case .defaultGreen:
            return Color.green50_green30
        case .defaultWhite:
            return .white
        case .clear:
            return Color.white
        }
    }
}
