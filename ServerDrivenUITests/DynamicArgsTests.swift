//
//  DynamicArgsTests.swift
//  ServerDrivenUITests
//
//  Created by Arshad shaikh on 19/11/2024.
//

import XCTest
@testable import ServerDrivenUI

final class DynamicArgsTests: XCTestCase {
  
  func testMatchesComponentName() {
    let args = DynamicArgs(dictionary: ["testField": "test"])
    XCTAssertTrue(args.matchesComponentName("testField"))
    XCTAssertFalse(args.matchesComponentName("nonexistent"))
  }
  
  func testGetValue() {
    let args = DynamicArgs(dictionary: ["testField": "test"])
    XCTAssertEqual(args.getValue(for: "testField"), "test")
    XCTAssertNil(args.getValue(for: "nonexistent"))
  }
  
  func testCodable() {
    let args = DynamicArgs(dictionary: ["testField": "test"])
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    do {
      let data = try encoder.encode(args)
      let decoded = try decoder.decode(DynamicArgs.self, from: data)
      XCTAssertEqual(decoded.getValue(for: "testField"), "test")
    } catch {
      XCTFail("Codable test failed with error: \(error)")
    }
  }
}
