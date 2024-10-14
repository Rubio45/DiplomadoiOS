//
//  TestVowelsCounter.swift
//  TestingClase1Tests
//
//  Created by Alex Diaz on 14/10/24.
//

import XCTest

class TestsVowelsCounter: XCTest {
    
    func testVowelsCounter() {
        
        let result = Vowels.VowelsCounter(string: "hola mundo")
        
        XCTAssertEqual(result, 4, "Hola Mundo tiene 4 vocales")
    }
    
    func testVowelsCounterZero() {
        let result = Vowels.VowelsCounter(string: "bjgkmbnhjfgds")
        
        XCTAssertEqual(result, 0, "La string no contiene ninguna vocal.")
    }
}
