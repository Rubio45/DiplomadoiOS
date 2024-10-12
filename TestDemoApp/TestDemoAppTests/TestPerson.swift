//
//  TestPerson.swift
//  TestDemoMiniApp
//
//  Created by Alex Diaz on 12/10/24.
//

import XCTest

class PersonTests: XCTestCase {
    
    func testAssertPersonEqualName() {
        let person = Person(name: "Alex", age: 252)
        
        XCTAssertEqual(person.name, "Alex", "El nombre debe ser igual a Alex")
    }
    
    func testAssertPersonGreaterOrEqualAge() {
        let person = Person(name: "Alex", age: 22)

        XCTAssertGreaterThanOrEqual(person.age, 18, "El usuario debe ser mayor de edad")
    }
    
    func testAssertPersonSayHello() {
        let person = Person(name: "Alex", age: 22)
        XCTAssertEqual(person.sayHello(), "Hello, my name is Alex and I am 22 years old.")
    }
}
