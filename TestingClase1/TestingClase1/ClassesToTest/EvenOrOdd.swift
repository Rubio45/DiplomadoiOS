//
//  EvenOrOdd.swift
//  TestingClase1
//
//  Created by Alex Diaz on 14/10/24.
//

import Foundation

/*
 Clase para verificar si un número es par o impar
 Crea una clase con una función que determine si un número es par o impar. Realiza las pruebas
 unitarias correspondientes para verificar el resultado.
 1. Crea la prueba unitaria para validar el caso de un número par.
 2. Crea la prueba unitaria para validar el caso de un número impar
 */

final class EvenOrOdd {
    
    static func isEven(number: Int) -> Bool {
        return number % 2 == 0 ? true : false
    }
}
