//
//  PitagoraCalculator.swift
//  TestDemoApp
//
//  Created by Alex Diaz on 12/10/24.
//

import Foundation

// https://www.dhiwise.com/post/understanding-swift-exponent-a-simple-guide-for-developers

class PitagoraCalculator {
    let cateto1: Double
    let cateto2: Double
    
    init(cateto1: Double, cateto2: Double) {
        self.cateto1 = cateto1
        self.cateto2 = cateto2
    }
    
    func calculateHypotenuse() -> Double {
        let hypotenuse = sqrt(pow(cateto1, 2) + pow(cateto2, 2))
        return hypotenuse
    }
}
