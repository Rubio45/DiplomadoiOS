//
//  TestPalindromo.swift
//  TestingClase1
//
//  Created by Alex Diaz on 14/10/24.
//

import XCTest

final class TestPalindromo: XCTestCase {
    
    func testWordPalindrome() {
        let string = "Reconocer"
        
        XCTAssertTrue(Palindromo.isPalindrome(string: string), "Reconocer es un palindromo")
    }
    
    func testPhrasePalindrome() {
        let string = "Roma ni se conoce sin oro, ni se conoce sin amor"
        
        XCTAssertTrue(Palindromo.isPalindrome(string: string), "Roma ni se conoce sin oro, ni se conoce sin amor es un palindromo")
    }
}
