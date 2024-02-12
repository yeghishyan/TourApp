//
//  UIDevice.swift
//  Pincam Auto
//
//  Created by miqo on 24.12.23.
//

import SwiftUI

extension UIDevice {
    var isiPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    var isiPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
}
