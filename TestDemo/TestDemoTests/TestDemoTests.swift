//
//  TestDemoTests.swift
//  TestDemoTests
//
//  Created by Alex Diaz on 12/10/24.
//

import XCTest
@testable import TestDemo

final class TestDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testExampleAssertTrue() {
        let boolValue =  true
        XCTAssertTrue(boolValue, "El valor es verdadero")
    }
    
    func testExampleAssertFalse() {
        let boolValue =  false
        XCTAssertFalse(boolValue, "El valor es false")
    }
    
    // func testExampleFail() {
      //  XCTFail("This test is meant to fail")
    // }
    
    func testExampleAssertGreaterThanOrEqual() {
        let a = 5
        let b = 5
        
        XCTAssertGreaterThanOrEqual(a, b, "a debe ser mayor o igual que b")
    }
    
    func testExampleAssertLessThanOrEqual() {
        let (a, b) = (5, 5)
        
        XCTAssertLessThanOrEqual(a, b, "a debe ser menor o igual que b")
    }
    
    func testExampleAssertEqual() {
        let (a, b) = (5, 5)
        
        XCTAssertEqual(a, b, "a y b deben ser igual")
    }
    
    func testExampleAssertNotEqual() {
        let (a, b) = (5, 6)
        
        XCTAssertNotEqual(a, b, "a y b deben ser diferentes")
    }
    
    func testExampleAssertNil() {
        let name: String? = nil
        
        XCTAssertNil(name, "Es un nulo")
    }
    
    func testExampleAssertNotNil() {
        let name: String? = "Juan"
        
        XCTAssertNotNil(name, "No es un nulo")
    }
    
    func testExampleAssertLessThan() {
        let a: Int = 5
        let b: Int = 6
        
        XCTAssertLessThan(a, b, "a debe ser menor que b")
    }
    
    func testExampleAssertGreaterThan() {
        let a: Int = 6
        let b: Int = 5
        
        XCTAssertGreaterThan(a, b, "a debe ser mayor que b")
    }
}
