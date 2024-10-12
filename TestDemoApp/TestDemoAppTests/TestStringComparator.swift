//
//  TestStringComparator.swift
//  TestDemoApp
//
//  Created by Alex Diaz on 12/10/24.
//

import XCTest

final class TestStringComparator: XCTestCase {
    func testAssertString1GreaterThan2() {
        let difference = 6
        XCTAssertEqual(StringComparator.compare("Hello World", "Hello"), "El string 1 es mayor que el 2 por \(difference)", "La strings deben ser iguales.")
    }
    
    func testAssertString1LessThan2() {
        let difference = 6
        XCTAssertEqual(StringComparator.compare("Hello", "Hello world"), "El string 2 es mayor que la 1 por \(difference)", "La strings deben ser iguales.")
    }
    
    func testAssertString1Equal2() {
        XCTAssertEqual(StringComparator.compare("Hola", "Cuba"), "Ambos miden lo mismo")
    }
}
