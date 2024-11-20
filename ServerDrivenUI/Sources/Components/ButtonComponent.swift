//
//  ButtonComponent.swift
//  ServerDrivenUI
//
//  Created by Arshad shaikh on 19/11/2024.
//

import SwiftUI

struct ButtonComponent: View {
  let data: ComponentData
  @Binding var formData: [String: String]
  @EnvironmentObject var eventHandler: EventHandler
  
  var body: some View {
    Button(data.text ?? "") {
      if data.type == DataType.submit.rawValue {
        eventHandler.handleEvent(EventType.submit.rawValue, data: formData)
      }
    }
    .buttonStyle(.borderedProminent)
  }
}
