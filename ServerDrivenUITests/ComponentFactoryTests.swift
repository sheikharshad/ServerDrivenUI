//
//  ComponentFactoryTests.swift
//  ServerDrivenUITests
//
//  Created by Arshad shaikh on 19/11/2024.
//

import XCTest
import SwiftUI
@testable import ServerDrivenUI

final class ComponentFactoryTests: XCTestCase {
  
  var sut: DefaultComponentFactory!
  @State var formData: [String: String] = [:]
  
  override func setUp() {
    super.setUp()
    sut = DefaultComponentFactory()
  }
  
  func testCreateTextComponent() {
    let data = ComponentData(componentType: "Text", text: "Test")
    let view = sut.createComponent(from: data, formData: $formData)
    XCTAssertNotNil(view)
  }
  
  func testCreateInputComponent() {
    let data = ComponentData(componentType: "Input",
                             hint: "Enter",
                             label: "Test",
                             name: "testField")
    let view = sut.createComponent(from: data, formData: $formData)
    XCTAssertNotNil(view)
  }
  
  func testCreateButtonComponent() {
    let data = ComponentData(componentType: "Button",
                             text: "Submit",
                             type: "submit")
    let view = sut.createComponent(from: data, formData: $formData)
    XCTAssertNotNil(view)
  }
}
