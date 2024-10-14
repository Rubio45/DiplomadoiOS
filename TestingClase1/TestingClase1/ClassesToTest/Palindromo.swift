//
//  Palindromo.swift
//  TestingClase1
//
//  Created by Alex Diaz on 14/10/24.
//

import Foundation

/*
Clase para validar si una cadena de texto es un palíndromo
 Crea una clase que contenga una función que determine si una cadena de texto es un
 palíndromo. Un palíndromo es una palabra o frase que se lee igual de izquierda a derecha que
 de derecha a izquierda, ignorando espacios y signos de puntuación. La función debe ser
 insensible a mayúsculas y minúsculas. Realiza las pruebas unitarias correspondientes para
 verificar el resultado.
 1. Crea la prueba unitaria para evaluar si una palabra es un palíndromo.
 a. Reconocer, anilina, radar
 2. Crea la prueba unitaria para evaluar si una frase es un palíndromo.
 a. Anita lava la tina
 b. Roma ni se conoce sin oro, ni se conoce sin amor
 */
final class Palindromo {

    static func isPalindrome(string: String) -> Bool {
        let originalString = Palindromo.removeExtraPunctuation(string: string)
        let reversedString = String(originalString.reversed())
        print(reversedString)
        print("---------------------------------")
        return originalString == reversedString
    }
    
    static func removeExtraPunctuation(string: String) -> String {
        let lowercasedString = string.lowercased()
        var cleanedString = ""

        for character in lowercasedString {
            switch character {
            case "a"..."z", "0"..."9":
                cleanedString.append(character)
                break
            default:
                break
            }
        }
        print(cleanedString)
        print("========================================")
        return cleanedString
    }
}
