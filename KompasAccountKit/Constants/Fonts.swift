//
//  Fonts.swift
//  Kompas.id
//
//  Created by Nur Irfan Pangestu on 04/04/22.
//

import Foundation
import SwiftUI

// MARK: - KompasFontConstant
/// Fonts:
/// Weight 300 = Light
/// Weight 400 = Regular
/// Weight 500 = Medium
/// Weight 600 = Semibold
/// Weight 700 = Bold
enum Fonts: String {
    case fontHindLight = "Hind-Light"
    case fontHindRegular = "Hind-Regular"
    case fontHindMedium = "Hind-Medium"
    case fontHindSemibold = "Hind-SemiBold"
    case fontHindBold = "Hind-Bold"
    case fontPlayBold = "PlayFairDisplay-Bold"
    case loraRegular = "Lora-Regular"
    case loraBold = "Lora-Bold"
    case loraItalic = "Lora-Italic"
    case loraSemibold = "Lora-SemiBold"
    case ptSansRegular = "PTSans-Regular"
    case ptSansBold = "PTSans-Bold"
    case ptSantItalic = "PTSans-Italic"
    case ptSansBolItalic = "PTSans-BoldItalic"
}

extension Font {
    static func custom(
        _ name: Fonts,
        size: CGFloat
    ) -> Font {
        return self.custom(name.rawValue, size: size)
    }
}
