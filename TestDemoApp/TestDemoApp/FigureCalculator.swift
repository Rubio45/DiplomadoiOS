//
//  FigureCalculator.swift
//  TestDemoApp
//
//  Created by Alex Diaz on 12/10/24.
//

import Foundation

/*
 Crea una clase para el cálculos de funciones matemáticas, en ella crear 3 funciones
 para calcular el área de figuras planas (círculo, trapecio, rombo), cada función debe
 recibir los parámetros correctos para el cálculo de su figura
 a. Realizar las pruebas unitarias correspondientes validando el resultado de cada
 función
 */

class FigureCalculator {
    static func calculateAreaCircle(radius: Double) -> Double {
        let pi = 3.14
        let area = pi * radius * radius
        return area
    }
    
    static func calculateAreaTrapecio(base1: Double, base2: Double, height: Double) -> Double {
        let area = ((base1 + base2) / 2) * height
        return area
    }
    
    static func calculateAreaRombo(diagonal1: Double, diagonal2: Double) -> Double {
        let area = (diagonal1 * diagonal2) / 2
        return area
    }
}
