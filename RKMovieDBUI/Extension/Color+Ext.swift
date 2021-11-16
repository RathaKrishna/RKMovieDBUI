//
//  Color+Ext.swift
//  RkMovieUI
//
//  Created by Rathakrishnan on 11/11/21.
//

import SwiftUI


extension Color {
    
  public init(red: Int, green: Int, blue: Int, opacity: Double = 1.0) {
    let redValue = Double(red) / 255.0
    let greenValue = Double(green) / 255.0
    let blueValue = Double(blue) / 255.0
    
    self.init(red: redValue, green: greenValue, blue: blueValue, opacity: opacity)
    }
    
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    public static let primaryColor = Color(hex: 0xE94C69)
    public static let lightRed = Color(red: 231, green: 76, blue: 60)
    public static let darkRed = Color(red: 192, green: 57, blue: 43)
    
    public static let btnBgColor = Color(hex: 0xE94C69)
    public static let btnBlack = Color(hex: 0x181930)
}
