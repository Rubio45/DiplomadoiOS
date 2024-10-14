//
//  PowerTests.swift
//  TestingClase1Tests
//
//  Created by Alex Diaz on 14/10/24.
//

import XCTest

final class PowerTests: XCTestCase {
    
    // funcion para verificar si un numero elevado a 0 es 1.
    func testPowerZero() {
        let result = Power.power(base: 2, exponent: 0)
        
        XCTAssertEqual(result, 1.0, accuracy: 0.0001, "Debe ser 0 cuando se eleva un numero a 0")
    }
    
    func testNegativeExponent() {
        let result = Power.power(base: 2, exponent: -1)
        
        XCTAssertEqual(result, 0.5, accuracy: 0.0001, "El exponente negativo se considera como el reciproco de la base elevado al exponente.")
    }
    
    func testPowerResult() {
        let result = Power.power(base: 2, exponent: 3)
        
        XCTAssertEqual(result, 8.0, accuracy: 0.0001, "El resultado de 2^3 es 8. ")
    }
}
