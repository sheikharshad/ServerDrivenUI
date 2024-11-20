//
//  ServerDrivenUI.swift
//  ServerDrivenUI
//
//  Created by Arshad shaikh on 19/11/2024.
//

import Foundation
import SwiftUI
 
public class ServerDrivenUIMain {
  
    public static let shared = ServerDrivenUIMain()
    private var eventCallback: ((String, [String: Any]) -> Void)?
    private init() {}
  
    public func initialize(eventHandler: @escaping (String, [String: Any]) -> Void) {
        self.eventCallback = eventHandler
    }
  
    public func createUIViewController(from json: String) -> UIViewController? {
        guard let screenData = parseJSON(json) else { return nil }
        return UIHostingController(rootView: DynamicScreenView(screenData: screenData) { eventType, data in
            self.eventCallback?(eventType, data)
        })
    }
  
    public func createView(from json: String) -> AnyView? {
        guard let screenData = parseJSON(json) else { return nil }
        return AnyView(DynamicScreenView(screenData: screenData) { eventType, data in
            self.eventCallback?(eventType, data)
        })
    }
  
    private func parseJSON(_ json: String) -> ScreenData? {
      guard let data = json.data(using: .utf8),
              let screenData = try? JSONDecoder().decode(ScreenData.self, from: data) else {
            return nil
        }
        return screenData
    }
}
 
extension ServerDrivenUIMain: ViewFactory {}
