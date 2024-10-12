//
//  TestFigureCalculator.swift
//  TestDemoAppTests
//
//  Created by Alex Diaz on 12/10/24.
//

import XCTest

final class TestsFigureCalculator: XCTestCase {
    func testAssertEqualCircle() {
        XCTAssertEqual(FigureCalculator.calculateAreaCircle(radius: 10), 314.000, accuracy: 0.001, "Deben ser igual a 314 cm^2")
    }
    
    func testAssertEqualTrapecio() {
        XCTAssertEqual(FigureCalculator.calculateAreaTrapecio(base1: 10.0, base2: 10.0, height: 10.0), 100.000, accuracy: 0.001, "Deben ser igual a 100")
    }
    
    func testAssertEqualRombo() {
        XCTAssertEqual(FigureCalculator.calculateAreaRombo(diagonal1: 10, diagonal2: 10), 50, accuracy: 0.001, "Deben ser igual a 50")
    }
}
