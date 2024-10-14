//
//  EvenTests.swift
//  TestingClase1Tests
//
//  Created by Alex Diaz on 14/10/24.
//

import XCTest

final class EvenTests: XCTestCase {
    
    func testEven() {
        XCTAssertTrue(EvenOrOdd.isEven(number: 10), "10 es un numero par")
    }
    
    func testOdd() {
        XCTAssertFalse(EvenOrOdd.isEven(number: 9), "9 es un numero impar")
    }
}
