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
    VStack(alignment: .leading, spacing: 4) {
      if let label = data.label {
        Text(label)
          .foregroundColor(.secondary)
      }
      TextField(data.hint ?? "", text: Binding(
        get: { formData[data.name ?? ""] ?? "" },
        set: { formData[data.name ?? ""] = $0 }
      ))
      .textFieldStyle(RoundedBorderTextFieldStyle())
      .padding(.bottom, 8)
    }
  }
}
