//
//  ServerDrivenUITests.swift
//  ServerDrivenUITests
//
//  Created by Arshad shaikh on 19/11/2024.
//

@testable import ServerDrivenUI
import SwiftUI
import XCTest

final class ServerDrivenUITests: XCTestCase {
  
  var sut: ServerDrivenUIMain!
  
  override func setUp() {
    super.setUp()
    sut = ServerDrivenUIMain.shared
  }
  
  func testInitializeEventHandler() {
    
    var didCallEventHandler = false
    sut.initialize { _, _ in
      didCallEventHandler = true
    }
    
    if let vc = sut.createUIViewController(from: TestHelpers.mockValidJSON),
       let hostingVC = vc as? UIHostingController<DynamicScreenView> {
      let eventHandler = hostingVC.rootView.eventCallback
      eventHandler("SUBMIT", ["test": "data"])
      XCTAssertTrue(didCallEventHandler)
    }
  }
  
  func testCreateViewControllerWithValidJSON() {
    let vc = sut.createUIViewController(from: TestHelpers.mockValidJSON)
    XCTAssertNotNil(vc)
  }
  
  func testCreateViewControllerWithInvalidJSON() {
    let vc = sut.createUIViewController(from: "invalid json")
    XCTAssertNil(vc)
  }
}
