//
//  DynamicScreenView.swift
//  ServerDrivenUI
//
//  Created by Arshad shaikh on 19/11/2024.
//

import SwiftUI

struct DynamicScreenView: View {
  let screenData: ScreenData
  let eventCallback: (String, [String: Any]) -> Void
  @State private var formData: [String: String] = [:]
  
  init(screenData: ScreenData, eventCallback: @escaping (String, [String: Any]) -> Void) {
    self.screenData = screenData
    self.eventCallback = eventCallback
  }
  
  var body: some View {
    if let screen = screenData.screens?.first,
       let events = screenData.events,
       let components = screen.components {
      ForEach(components, id: \.componentType) { component in
        DefaultComponentFactory()
          .createComponent(from: component, formData: $formData)
      }
      .environmentObject(EventHandler(events: events, callback: eventCallback))
    }
  }
}
