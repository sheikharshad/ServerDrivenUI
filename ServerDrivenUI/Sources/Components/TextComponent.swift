//
//  TextComponent.swift
//  ServerDrivenUI
//
//  Created by Arshad shaikh on 19/11/2024.
//

import SwiftUI

struct TextComponent: View {
  let data: ComponentData
  
  var body: some View {
    Text(data.text ?? "")
      .font(.system(size: ThemeConstants.FontSize.md))
      .foregroundColor(ThemeConstants.Colors.text)
      .multilineTextAlignment(.leading)
  }
}
