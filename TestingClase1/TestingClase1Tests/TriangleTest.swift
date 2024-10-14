//
//  TriangleTest.swift
//  TestingClase1Tests
//
//  Created by Alex Diaz on 14/10/24.
//

import XCTest

final class TriangleTest: XCTestCase {
    
    func testAreaCalculation() {
        let area = Triangle.calculateArea(base: 10, height: 10)
        
        XCTAssertEqual(area, 50, "El area debe ser igual a 50")
    }
}
