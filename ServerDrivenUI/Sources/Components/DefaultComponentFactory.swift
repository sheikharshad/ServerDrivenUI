//
//  DefaultComponentFactory.swift
//  ServerDrivenUI
//
//  Created by Arshad shaikh on 19/11/2024.
//

import SwiftUI

class DefaultComponentFactory: ComponentFactory {
  
  init() {}
  
  func createComponent(from data: ComponentData, formData: Binding<[String: String]>) -> AnyView {
    let type = ComponentType(rawValue: data.componentType)
    switch type {
    case .form:
      return AnyView(FormComponent(data: data, formData: formData))
    case .container:
      return AnyView(ContainerComponent(data: data, formData: formData))
    case .text:
      return AnyView(TextComponent(data: data))
    case .input:
      return AnyView(InputComponent(data: data, formData: formData))
    case .button:
      return AnyView(ButtonComponent(data: data, formData: formData))
    default:
      return AnyView(EmptyView())
    }
  }
}
