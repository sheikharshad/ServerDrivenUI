//
//  ViewModifiers.swift
//  ServerDrivenUI
//
//  Created by Arshad shaikh on 20/11/2024.
//

import SwiftUI

struct PrimaryButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(.horizontal, ThemeConstants.Spacing.md)
      .padding(.vertical, ThemeConstants.Spacing.sm)
      .background(ThemeConstants.Colors.primary)
      .foregroundColor(.white)
      .cornerRadius(ThemeConstants.BorderRadius.md)
      .shadow(
        color: ThemeConstants.ShadowConfig.small.color,
        radius: ThemeConstants.ShadowConfig.small.radius,
        x: ThemeConstants.ShadowConfig.small.x,
        y: ThemeConstants.ShadowConfig.small.y
      )
  }
}

struct InputFieldStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(ThemeConstants.Spacing.sm)
      .background(ThemeConstants.Colors.surface)
      .cornerRadius(ThemeConstants.BorderRadius.sm)
      .overlay(
        RoundedRectangle(cornerRadius: ThemeConstants.BorderRadius.sm)
          .stroke(ThemeConstants.Colors.border, lineWidth: 1)
      )
  }
}

struct FormContainerStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(ThemeConstants.Spacing.md)
      .background(ThemeConstants.Colors.surface)
      .cornerRadius(ThemeConstants.BorderRadius.lg)
      .shadow(
        color: ThemeConstants.ShadowConfig.medium.color,
        radius: ThemeConstants.ShadowConfig.medium.radius,
        x: ThemeConstants.ShadowConfig.medium.x,
        y: ThemeConstants.ShadowConfig.medium.y
      )
  }
}

// View Extensions
extension View {
  func primaryButtonStyle() -> some View {
    modifier(PrimaryButtonStyle())
  }
  
  func inputFieldStyle() -> some View {
    modifier(InputFieldStyle())
  }
  
  func formContainerStyle() -> some View {
    modifier(FormContainerStyle())
  }
}
