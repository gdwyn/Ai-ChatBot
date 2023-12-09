//
//  ColorExtension.swift
//  AiChatBot
//
//  Created by Godwin IE on 09/12/2023.
//

import SwiftUI

extension ShapeStyle where Self == Color {

    static var kGray: Color {
        Color(hex: 0xffCECECE)
    }
    
    static var kBlue: Color {
        Color(hex: 0xff9FD8F8)
    }
    
    static var kPink: Color {
        Color(hex: 0xffF7CCE7)
    }
    
    static var kGreen: Color {
        Color(hex: 0xffE0F082)
    }
}


extension Color {
    init(hex: UInt, opacity: Double = 1.0) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double(hex & 0x0000FF) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

