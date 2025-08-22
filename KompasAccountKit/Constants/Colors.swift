//
//  Colors.swift
//  kompasid
//
//  Created by Kompas Digital on 24/10/23.
//

import Foundation
import SwiftUI

/**
 Colors are read in the following manner
 `<LIGHT_MODE_VALUE>_<DARK_MODE_VALUE>`

 We group colors based on their light mode values for easier tracking.
 So, suppose you have a color pair of light grey 10 for light mode and blue 30 for dark mode, you would  create:
 static let lighGrey10_blue30 = Color("...")
 As for the Color name that corresponds to the asset catalog, existing colors could just be renamed accordingly

 Also you may wonder why I use 'lightGrey' instead of 'Neutral', this is because light & dark mode both have different neutral values.
 Refer to HEX values in `KColorEnum`
 */
// MARK: - LIGHT GREY
extension Color {
    static let lightGrey10_surface00 = Color("LightGrey10_Surface00") // ✅
    static let lightGrey10_surface02 = Color("LightGrey10_Surface02") // ✅
    static let lightGrey10_surface08 = Color("LightGrey10_Surface08") // ✅
    static let lightGrey10_darkGrey60 = Color("LightGrey10_DarkGrey60") // ✅
    static let lightGrey20_darkGrey70 = Color("LightGrey20_DarkGrey70") // ✅
    static let lightGrey20_surface00 = Color("LightGrey20_Surface00") // ✅
    static let lightGrey20_surface02 = Color("LightGrey20_Surface02") // ✅
    static let lightGrey20_lightGrey20 = Color("LightGrey20_LightGrey20") // ✅
    static let lightGrey20_surface08 = Color("LightGrey20_Surface08") // ✅
    static let lightGrey20_surface16 = Color("LightGrey20_Surface16") // ✅
    static let lightGrey20_surface24 = Color("LightGrey20_Surface24")
    static let lightGrey30_clear = Color("LightGrey30_Clear") // ✅
    static let lightGrey30_white12 = Color("LightGrey30_White12") // ✅
    static let lightGrey30_darkGrey12 = Color("LightGrey30_DarkGrey12") // ✅
    static let lightGrey30_darkGrey20 = Color("LightGrey30_DarkGrey20") // ✅
    static let lightGrey30_darkGrey30 = Color("LightGrey30_DarkGrey30") // ✅
    static let lightGrey30_darkGrey40 = Color("LightGrey30_DarkGrey40") // ✅
    static let lightGrey30_surface01 = Color("LightGrey30_Surface01") // ✅
    static let lightGrey30_surface04 = Color("LightGrey30_Surface04") // ✅
    static let lightGrey30_surface16 = Color("LightGrey30_Surface16") // ✅
    static let lightGrey30_text38 = Color("LightGrey30_Text38") // ✅
    static let lightGrey30_lightGrey30 = Color("LightGrey30_LightGrey30") // ✅
    static let lightGrey30_text60 = Color("LightGrey30_Text60") // ✅
    static let lightGrey30_text87 = Color("LightGrey30_Text87") // ✅
    static let lightGrey40_darkGrey20 = Color("LightGrey40_DarkGrey20") // ✅
    static let lightGrey40_darkGrey30 = Color("LightGrey40_DarkGrey30") // ✅
    static let lightGrey40_darkGrey40 = Color("LightGrey40_DarkGrey40") // ✅
    static let lightGrey40_lightGrey40 = Color("LightGrey40_LightGrey40") // ✅
    static let lightGrey40_surface16 = Color("LightGrey40_Surface16") // ✅
    static let lightGrey40_surface30 = Color("LightGrey40_Surface30") // ✅
    static let lightGrey40_text60 = Color("LightGrey40_Text60") // ✅
    static let lightGrey40_text70 = Color("LightGrey40_Text70") // ✅
    static let lightGrey50_darkGrey10 = Color("LightGrey50_DarkGrey10") // ✅
    static let lightGrey50_darkGrey20 = Color("LightGrey50_DarkGrey20") // ✅
    static let lightGrey50_lightGrey50 = Color("LightGrey50_LightGrey50") // ✅
    static let lightGrey50_surface06 = Color("LightGrey50_Surface06") // ✅
    static let lightGrey50_text50 = Color("LightGrey50_Text50") // ✅
    static let lightGrey50_text70 = Color("LightGrey50_Text70") // ✅
    static let lightGrey50_text87 = Color("LightGrey50_Text87") // ✅
    static let lightGrey50_white = Color("LightGrey50_White") // ✅
    static let lightGrey60_darkGrey10 = Color("LightGrey60_DarkGrey10") // ✅
    static let lightGrey60_darkGrey20 = Color("LightGrey60_DarkGrey20") // ✅
    static let lightGrey60_darkGrey50 = Color("LightGrey60_DarkGrey50") // ✅
    static let lightGrey60_darkGrey70 = Color("LightGrey60_DarkGrey70") // ✅
    static let lightGrey60_lightGrey60 = Color("LightGrey60_LightGrey60") //
    static let lightGrey60_text100 = Color("LightGrey60_Text100") // ✅
    static let lightGrey60_surface01 = Color("LightGrey60_Surface01") // ✅
    static let lightGrey60_text70 = Color("LightGrey60_Text70") // ✅
    static let lightGrey60_text87 = Color("LightGrey60_Text87") // ✅
    static let lightGrey60_white = Color("LightGrey60_White") // ✅
    static let lightGrey60_blue30 = Color("LightGrey60_Blue30") // ✅
}

// MARK: - DARK GREY
extension Color {
    static let darkGrey10_surface04 = Color("DarkGrey10_Surface04") // ✅
}

// MARK: - WHITE
extension Color {
    static let white_blue30 = Color("White_Blue30") // ✅
    static let white_darkGrey30 = Color("White_DarkGrey30") // ✅
    static let white_darkGrey60 = Color("White_DarkGrey60") // ✅
    static let white_darkGrey70 = Color("White_DarkGrey70") // ✅
    static let white_surface00 = Color("White_Surface00") // ✅
    static let white_surface01 = Color("White_Surface01") // ✅
    static let white_surface02 = Color("White_Surface02") // ✅
    static let white_surface03 = Color("White_Surface03") // ✅
    static let white_surface04 = Color("White_Surface04") // ✅
    static let white_surface05 = Color("White_Surface05") // ✅
    static let white_surface06 = Color("White_Surface06") // ✅
    static let white_surface08 = Color("White_Surface08") // ✅
    static let white_surface12 = Color("White_Surface12") // ✅
    static let white_surface16 = Color("White_Surface16") // ✅
    static let white_surface24 = Color("White_Surface24") // ✅
    static let white_surface30 = Color("White_Surface30") // ✅
    static let white_text87 = Color("White_Text87") // ✅
    static let white_white = Color("White_White") // ✅
}

extension Color {
    static let black_blue70 = Color("Black_Blue70") // 80% Opacity // ✅
    static let black_darkGrey60 = Color("Black_DarkGrey60") // ✅
    static let black_text87 = Color("Black_Text87") // ✅
}

// MARK: - ROYAL BLUE
extension Color {
    static let royal60_blue20 = Color("Royal60_Blue20") // ✅
    static let royal60_blue30 = Color("Royal60_Blue30") // ✅
    static let royal60_blue50 = Color("Royal60_Blue50") // ✅
    static let royal60_darkGrey10 = Color("Royal60_DarkGrey10") // ✅
    static let royal60_royal60 = Color("Royal60_Royal60") // ✅
    static let royal60_surface04 = Color("Royal60_Surface04") // ✅
    static let royal60_text87 = Color("Royal60_Text87") // ✅
    static let royal60_white = Color("Royal60_White") // ✅
    static let royal60_blue60 = Color("Royal60_Blue60") // ✅
    static let royal70_royal70 = Color("Royal70_Royal70") // ✅
    static let royal70_surface06 = Color("Royal70_Surface06") // ✅
}

// MARK: - BLUE
extension Color {
    static let blue10_blue10 = Color("Blue10_Blue10") // ✅
    static let blue10_blue30 = Color("Blue10_Blue30") // ✅
    static let blue10_blue20 = Color("Blue10_Blue20") // ✅
    static let blue10_blue70 = Color("Blue10_Blue70") // ✅
    static let blue10_darkGrey38 = Color("Blue10_DarkGrey38") // ✅
    static let blue10_darkGrey60 = Color("Blue10_DarkGrey60") // ✅
    static let blue10_surface06 = Color("Blue10_Surface06") // ✅
    static let blue10_surface16 = Color("Blue10_Surface16") // ✅
    static let blue10_surface24 = Color("Blue10_Surface24") // ✅
    static let blue10_surface12 = Color("Blue10_Surface12") // ✅
    static let blue10_yaleBlue = Color("Blue10_YaleBlue") // 50% Opacity ✅
    static let blue20_blue70 = Color("Blue20_Blue70") // ✅
    static let blue30_blue70 = Color("Blue20_Blue70") // ✅
    static let blue40_blue40 = Color("Blue40_Blue40") // ✅
    static let blue50_blue50 = Color("Blue50_Blue50") // ✅
    static let blue50_blue70 = Color("Blue50_Blue70") // ✅
    static let blue60_blue20 = Color("Blue60_Blue20") // ✅
    static let blue60_blue60 = Color("Blue60_Blue60") // ✅
    static let blue60_lightGrey60 = Color("Blue60_LightGrey60") // ✅
    static let blue60_surface06 = Color("Blue60_Surface06")
    static let blue60_surface00 = Color("Blue60_Surface00")
    static let blue60_royalBlue70 = Color("Blue60_Royal70") // ✅
    static let royalBlue60_royalBlue60 = Color("Royal60_Royal60") // ✅
    static let blue10Opacity40_surface06 = Color("Blue10Opacity40_Surface06")
}

// MARK: - GREEN
extension Color {
    static let green10_calPolyGreen = Color("Green10_CalPolyGreen")
    static let green10_green20 = Color("Green10_Green20")
    static let green50_green30 = Color("Green50_Green30")
    static let green50_green60 = Color("Green50_Green60")
    static let green60_calPolyGreen = Color("Green60_CalPolyGreen")
    static let green60_green20 = Color("Green60_Green20")
    static let green10_green10 = Color("Green10_Green10")
    static let green60_green60 = Color("Green60_Green60")
}

// MARK: - RED
extension Color {
    static let red10_red10 = Color("Red10_Red10")
    static let red10_red20 = Color("Red10_Red20")
    static let red10_red60 = Color("Red10_Red60")
    static let red20_red20 = Color("Red20_Red20")
    static let red50_red30 = Color("Red50_Red30")
    static let red50_red50 = Color("Red50_Red50")
    static let red50_red40 = Color("Red50_Red40")
    static let red50_red60 = Color("Red50_Red60")
    static let red50_red70 = Color("Red50_Red70")
    static let red60_red60 = Color("Red60_Red60")
}

// MARK: - ORANGE
extension Color {
    static let orange10_orange20 = Color("Orange10_Orange20")
    static let orange10_orange10 = Color("Orange10_Orange10")
    static let orange40_orange40 = Color("Orange40_Orange40")
    static let orange50_orange50 = Color("Orange50_Orange50")
    static let orange60_orange60 = Color("Orange60_Orange60")
    static let orange60_orange70 = Color("Orange60_Orange70")
}

// MARK: - YELLOW
extension Color {
    static let yellow40_yellow40 = Color("Yellow40_Yellow40")
    static let yellow20_yellow20 = Color("Yellow20_Yellow20")
}

// MARK: - BROWN
extension Color {
    static let brown10_brown10 = Color("Brown10_Brown10")
}

// MARK: - OTHERS
/// Ini yang starting color nya pakai color lama belum diberikan nama oleh designer jadi merujuk dengan coloors
extension Color {
    static let aliceBlue_blue70 = Color("AliceBlue_Blue70")
    static let aliceBlue_lightGrey60 = Color("AliceBlue_LightGrey60")
    static let aliceBlue_royalBlue70 = Color("AliceBlue_RoyalBlue70")
    static let crayolaBlue_crayolaBlue = Color("CrayolaBlue_CrayolaBlue")
    static let fireEngineRed_red30 = Color("FireEngineRed_Red30")
    static let fireEngineRed_red40 = Color("FireEngineRed_Red40")
    static let fireEngineRed_red50 = Color("FireEngineRed_Red50")
    static let jonquilYellow_jonquilYellow = Color("JonquilYellow_JonquilYellow")
    static let jonquilYellow_yellow30 = Color("JonquilYellow_Yellow30")
    static let offRed_red10 = Color("OffRed_Red10")
    static let offRed_red40 = Color("OffRed_Red40")
    static let onyx_text87 = Color("Onyx_Text87")
    static let seasalt_darkGrey50 = Color("Seasalt_DarkGrey50")
    static let seasalt_darkGrey60 = Color("Seasalt_DarkGrey60")
    static let seasalt_surface06 = Color("Seasalt_Surface06")
    static let seasalt_text87 = Color("Seasalt_Text87")
    static let silver_darkGrey50 = Color("Silver_DarkGrey50")
    static let taupeGray_taupeGray = Color("TaupeGray_TaupeGray")
}
