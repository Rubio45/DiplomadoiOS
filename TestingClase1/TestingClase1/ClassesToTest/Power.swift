//
//  Power.swift
//  TestingClase1
//
//  Created by Alex Diaz on 14/10/24.
//

import Foundation

/*
 Crea una clase que contenga una función para calcular la potencia de un número dado, donde la
 base y el exponente se pasen como parámetros. Realiza las pruebas unitarias correspondientes
 para validar el resultado.
 1. Crea la prueba unitaria para validar la potencia de un número
 2. Crea la prueba unitaria para validar que un número a la potencia 0 es igual a 1
 */

final class Power {
    
    static func power(base: Double, exponent: Int) -> Double {
        if exponent == 0 {
            return 1
        }
        
        // si el exponente es negativo, entonces debe dar 1/base^exponent.
        if exponent < 0 {
            return 1 / power(base: base, exponent: -exponent)
        }
        var result: Double = 1
        // mejor de los casos.
        for _ in 1...exponent {
            result *= base
        }
        
        return result
    }
}
