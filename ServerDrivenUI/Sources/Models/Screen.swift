//
//  Screen.swift
//  ServerDrivenUI
//
//  Created by Arshad shaikh on 19/11/2024.
//

import Foundation

struct ScreenData: Codable {
  let screens: [Screen]?
  let events: [Event]?
  
  init(screens: [Screen], events: [Event]) {
    self.screens = screens
    self.events = events
  }
}

struct Screen: Codable, Identifiable {
  let id: String
  let components: [ComponentData]?
  
  init(id: String, components: [ComponentData]) {
    self.id = id
    self.components = components
  }
}

struct ComponentData: Codable {
  let componentType: String
  let gap: Int?
  let onSubmit: String?
  let components: [ComponentData]?
  let text: String?
  let hint: String?
  let label: String?
  let name: String?
  let type: String?
  
  init(componentType: String, gap: Int? = nil, onSubmit: String? = nil,
       components: [ComponentData]? = nil, text: String? = nil,
       hint: String? = nil, label: String? = nil, name: String? = nil,
       type: String? = nil) {
    self.componentType = componentType
    self.gap = gap
    self.onSubmit = onSubmit
    self.components = components
    self.text = text
    self.hint = hint
    self.label = label
    self.name = name
    self.type = type
  }
}
