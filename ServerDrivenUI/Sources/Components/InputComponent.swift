//
//  InputComponent.swift
//  ServerDrivenUI
//
//  Created by Arshad shaikh on 19/11/2024.
//

import SwiftUI

struct InputComponent: View {
  let data: ComponentData
  @Binding var formData: [String: String]
  
  var body: some View {
    VStack(alignment: .leading, spacing: ThemeConstants.Spacing.xxs) {
      if let label = data.label {
        Text(label)
          .font(.system(size: ThemeConstants.FontSize.sm))
          .foregroundColor(ThemeConstants.Colors.textSecondary)
      }
      
      TextField(data.hint ?? "", text: Binding(
        get: { formData[data.name ?? ""] ?? "" },
        set: { formData[data.name ?? ""] = $0 }
      ))
      .font(.system(size: ThemeConstants.FontSize.md))
      .inputFieldStyle()
    }
  }
}
