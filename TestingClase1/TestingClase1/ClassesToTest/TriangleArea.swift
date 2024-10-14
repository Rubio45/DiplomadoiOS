//
//  TriangleArea.swift
//  TestingClase1
//
//  Created by Alex Diaz on 14/10/24.
//

import Foundation

/*
 Clase para calcular el área de un triángulo
 Crea una clase que calcule el área de un triángulo dado su base y altura. Realiza las pruebas
 unitarias para validar el resultado.
 1. Crea la prueba unitaria para validar el resultado del cálculo del área de un triángulo
 */

final class Triangle {
    static func calculateArea(base: Double, height: Double) -> Double {
        let area = 0.5 * base * height
        return area
    }
}
