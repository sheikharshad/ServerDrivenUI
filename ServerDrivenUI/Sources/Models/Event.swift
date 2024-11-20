//
//  Event.swift
//  ServerDrivenUI
//
//  Created by Arshad shaikh on 19/11/2024.
//

import Foundation

struct Event: Codable {
  let type: String?
  let actions: [Action]?
  
  init(type: String, actions: [Action]) {
    self.type = type
    self.actions = actions
  }
}

struct Action: Codable {
  let type: String?
  let args: [DynamicArgs]?
  
  init(type: String, args: [DynamicArgs]) {
    self.type = type
    self.args = args
  }
}

struct DynamicArgs: Codable {
  private var values: [String: String]
  
  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    values = try container.decode([String: String].self)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(values)
  }
  
  func matchesComponentName(_ name: String) -> Bool {
    values.keys.contains(name)
  }
  
  func getValue(for name: String) -> String? {
    values[name]
  }
  
  //utility
  init(dictionary: [String: String]) {
    self.values = dictionary
  }
}
