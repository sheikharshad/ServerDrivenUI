//
//  ThemeConstants.swift
//  ServerDrivenUI
//
//  Created by Arshad shaikh on 20/11/2024.
//

import SwiftUI

struct ThemeConstants {
  // MARK: - Colors
  struct Colors {
    static let primary = Color(hex: "007AFF")
    static let secondary = Color(hex: "5856D6")
    static let background = Color(hex: "F2F2F7")
    static let surface = Color.white
    static let error = Color(hex: "FF3B30")
    static let text = Color(hex: "000000")
    static let textSecondary = Color(hex: "8E8E93")
    static let border = Color(hex: "C6C6C8")
  }
  
  // MARK: - Spacing
  struct Spacing {
    static let xxxs: CGFloat = 2
    static let xxs: CGFloat = 4
    static let xs: CGFloat = 8
    static let sm: CGFloat = 12
    static let md: CGFloat = 16
    static let lg: CGFloat = 24
    static let xl: CGFloat = 32
    static let xxl: CGFloat = 40
  }
  
  // MARK: - BorderRadius
  struct BorderRadius {
    static let sm: CGFloat = 4
    static let md: CGFloat = 8
    static let lg: CGFloat = 12
  }
  
  // MARK: - FontSize
  struct FontSize {
    static let xs: CGFloat = 12
    static let sm: CGFloat = 14
    static let md: CGFloat = 16
    static let lg: CGFloat = 18
    static let xl: CGFloat = 20
    static let xxl: CGFloat = 24
  }
  
  // MARK: - Shadow
  struct ShadowConfig {
    static let small = (color: Color.black.opacity(0.1),
                        radius: 4.0,
                        x: 0.0,
                        y: 2.0)
    
    static let medium = (color: Color.black.opacity(0.15),
                         radius: 8.0,
                         x: 0.0,
                         y: 4.0)
  }
}

// MARK: - Color Extension
extension Color {
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
    case 3:
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6:
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8:
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (255, 0, 0, 0)
    }
    self.init(
      .sRGB,
      red: Double(r) / 255,
      green: Double(g) / 255,
      blue:  Double(b) / 255,
      opacity: Double(a) / 255
    )
  }
}
