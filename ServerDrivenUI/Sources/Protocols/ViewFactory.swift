//
//  ViewFactory.swift
//  ServerDrivenUI
//
//  Created by Arshad shaikh on 19/11/2024.
//

import SwiftUI

protocol ViewFactory {
  func createUIViewController(from json: String) -> UIViewController?
  func createView(from json: String) -> AnyView?
}

protocol ComponentFactory {
  func createComponent(from data: ComponentData, formData: Binding<[String: String]>) -> AnyView
}
