//
//  Font.swift
//  BritaliansTV
//
//  Created by miqo on 07.11.23.
//

import SwiftUI

extension Font {
    public static func appFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font {
        let fontFamily = "Poppins"
        var fontWeight = "-Regular"
        
        switch weight {
        case .black:        fontWeight = "-Black"
        case .heavy:        fontWeight = "-ExtraBold"
        case .bold:         fontWeight = "-Bold"
        case .semibold:     fontWeight = "-SemiBold"
        case .regular:      fontWeight = "-Regular"
        case .medium:       fontWeight = "-Medium"
        case .thin:         fontWeight = "-Thin"
        case .light:        fontWeight = "-Light"
        case .ultraLight:   fontWeight = "-ExtraLight"
        default: break
        }
        
        let font = Font.custom(fontFamily + fontWeight, size: size)
        return font
    }
}

extension UIFont {
    public static func appFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> UIFont {
        let fontFamily = "Poppins"
        var fontWeight = "-Regular"
        
        switch weight {
        case .black:        fontWeight = "-Black"
        case .heavy:        fontWeight = "-ExtraBold"
        case .bold:         fontWeight = "-Bold"
        case .semibold:     fontWeight = "-SemiBold"
        case .regular:      fontWeight = "-Regular"
        case .medium:       fontWeight = "-Medium"
        case .thin:         fontWeight = "-Thin"
        case .light:        fontWeight = "-Light"
        case .ultraLight:   fontWeight = "-ExtraLight"
        default: break
        }
        
        let font = UIFont(name: fontFamily + fontWeight, size: size)
        return font ?? UIFont.systemFont(ofSize: size)
    }
}

