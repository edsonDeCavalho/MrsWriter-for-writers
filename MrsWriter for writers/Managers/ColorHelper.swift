//
//  ColorHelper.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 12/08/2024.
//

import Foundation
import SwiftUI


func hexString(from color: Color) -> String {
    // Extract the UIColor components
    let uiColor = UIColor(color)
    
    // Get the RGBA components
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    
    uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    // Convert to a hex string
    let redHex = String(format: "%02X", Int(red * 255))
    let greenHex = String(format: "%02X", Int(green * 255))
    let blueHex = String(format: "%02X", Int(blue * 255))
    
    return "#\(redHex)\(greenHex)\(blueHex)"
}
