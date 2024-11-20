//
//  FormComponent.swift
//  ServerDrivenUI
//
//  Created by Arshad shaikh on 19/11/2024.
//
import SwiftUI

struct FormComponent: View {
  let data: ComponentData
  @Binding var formData: [String: String]
  @EnvironmentObject var eventHandler: EventHandler
  
  var body: some View {
    VStack(spacing: CGFloat(data.gap ?? 0)) {
      if let components = data.components {
        ForEach(Array(components.enumerated()), id: \.offset) { _, component in
          DefaultComponentFactory()
            .createComponent(from: component, formData: $formData)
        }
      }
    }
  }
}