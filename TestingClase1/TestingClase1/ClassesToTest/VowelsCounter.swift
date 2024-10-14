//
//  VowelsCounter.swift
//  TestingClase1
//
//  Created by Alex Diaz on 14/10/24.
//

import Foundation

/*
 Clase para contar vocales en una cadena
Crea una clase que contenga una función para contar el número de vocales en una cadena de
texto. Realiza las pruebas unitarias correspondientes para verificar el resultado.
1. Crea la prueba unitaria para validar la cantidad de vocales en un texto
a. “hola mundo” = 4 vocales
2. Crea la prueba unitaria para validar que la cantidad de vocales en un texto es 0.
a. Use una cadena de texto aleatoria, sin sentido para validar este caso, ejemplo:
“bcdfghjkl” = 0 vocales
 */

class Vowels {
    static func VowelsCounter(string: String) -> Int {
        let lowercasedString = string.lowercased()
        var counter: Int = 0
        for letter in lowercasedString {
            switch letter {
                // si encuenta alguna de estas variables, suma 1 al contador.
            case "a", "e", "i", "o", "u":
                counter += 1
                break
            default:
                break
            }
        }
        return counter
    }
}
