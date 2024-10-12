//
//  Person.swift
//  TestDemoApp
//
//  Created by Alex Diaz on 12/10/24.
//

import Foundation

class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sayHello() -> String {
        return "Hello, my name is \(name) and I am \(age) years old."
    }
}

