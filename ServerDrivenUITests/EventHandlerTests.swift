//
//  EventHandlerTests.swift
//  ServerDrivenUITests
//
//  Created by Arshad shaikh on 19/11/2024.
//

import XCTest
@testable import ServerDrivenUI

final class EventHandlerTests: XCTestCase {
  var sut: EventHandler!
  
  override func setUp() {
    super.setUp()
    let mockEvents = [Event(type: "SUBMIT",
                            actions: [Action(type: "log",
                                             args: [DynamicArgs(dictionary: ["testField": "test"])])])]
    sut = EventHandler(events: mockEvents) { _, _ in }
  }
  
  func testHandleEvent() {
    var receivedData: [String: Any]?
    sut = EventHandler(events: sut.events) { _, data in
      receivedData = data
    }
    sut.handleEvent("SUBMIT", data: ["testField": "value"])
    XCTAssertNotNil(receivedData)
    XCTAssertEqual(receivedData?["testField"] as? String, "value")
  }
  
  func testEventNotFound() {
    var callbackCalled = false
    sut = EventHandler(events: sut.events) { _, _ in
      callbackCalled = true
    }
    sut.handleEvent("NONEXISTENT", data: [:])
    XCTAssertFalse(callbackCalled)
  }
}
