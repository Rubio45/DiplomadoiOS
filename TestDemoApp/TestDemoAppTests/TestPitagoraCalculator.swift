//
//  TestPitagoraCalculator.swift
//  TestDemoAppTests
//
//  Created by Alex Diaz on 12/10/24.
//

import XCTest

final class TestPitagoraCalculator: XCTestCase {

    func testAssertHypotenuse() {
        let pitagoraCalculator = PitagoraCalculator(cateto1: 3, cateto2: 4)
        XCTAssertEqual(pitagoraCalculator.calculateHypotenuse(), 5, accuracy: 0.001, "La hipotenusa debe ser igual a 5")
    }

}
