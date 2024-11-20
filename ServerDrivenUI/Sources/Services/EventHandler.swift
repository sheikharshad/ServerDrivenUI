//
//  EventHandler.swift
//  ServerDrivenUI
//
//  Created by Arshad shaikh on 19/11/2024.
//

import Foundation
import Combine
import SwiftUI

class EventHandler: ObservableObject {
  let events: [Event]
  let callback: (String, [String: Any]) -> Void
  
  init(events: [Event], callback: @escaping (String, [String: Any]) -> Void) {
    self.events = events
    self.callback = callback
  }
  
  func handleEvent(_ type: String, data: [String: String]) {
    guard let event = events.first(where: { $0.type == type }),
    let actions = event.actions else { return }
    for action in actions {
      let filteredData = data.filter { key, _ in
        if let args = action.args {
          return args.contains { arg in arg.matchesComponentName(key) }
        }
        return false
      }
      callback(type, filteredData)
    }
  }
}
