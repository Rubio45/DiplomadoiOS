//
//  StringComparator.swift
//  TestDemoApp
//
//  Created by Alex Diaz on 12/10/24.
//

import Foundation

/*
 Desarrolle una clase helper para cadenas de texto, con una función que dadas dos
 cadenas de texto determine cuál es la de mayor longitud y por cuantos caracteres.
 a. Realizar las pruebas unitarias para la validación del texto resultante ej: “La
 palabra Cuatro es más larga que la palabra Uno, por 3 letras”
 */

class StringComparator {

    static func compare(_ string1: String, _ string2: String) -> String {
        let length1 = string1.count
        let length2 = string2.count
        let difference = length1 - length2
        
        if length1 > length2 {
            return "El string 1 es mayor que el 2 por \(difference)"
        } else if length1 < length2 {
            return "El string 2 es mayor que la 1 por \(-difference)"
        } else {
            return "Ambos miden lo mismo"
        }
    }
}
