import Foundation

/*Ejercicio 1: Enumeraciones y Delegación
 Implementar una enumeración EstadoPedido con casos procesando, enviado, y
 entregado. Crear un protocolo NotificacionPedido con un método
 notificarCambioDeEstado. Implementar una clase Pedido que tenga una propiedad
 estado de tipo EstadoPedido y una propiedad delegado de tipo
 NotificacionPedido. Crear una función que cambie el estado del pedido y notifique al
 delegado.*/

// Definir el enum EstadoPedido
enum EstadoPedido {
    case procesando
    case enviado
    case entregado
}

//protocolo NotificacionPedido
protocol NotificacionPedido {
    func notificarCambioDeEstado(nuevoEstado: EstadoPedido)
}

//clase Pedido
class Pedido {
    var estado: EstadoPedido
    var delegado: NotificacionPedido?

    init(estado: EstadoPedido) {
        self.estado = estado
    }

    //funcion para cambiar el estado del pedido y notificar al delegado
    func cambiarEstado(nuevoEstado: EstadoPedido) {
        estado = nuevoEstado
        if delegado != nil{
            delegado?.notificarCambioDeEstado(nuevoEstado: nuevoEstado)
        }
    }
}

// clase que se conforma a al protocolo NotificacionPedido
class GestorPedidos: NotificacionPedido {
    func notificarCambioDeEstado(nuevoEstado: EstadoPedido) {
        print("El estado del pedido es: \(nuevoEstado)")
    }
}

//crear un peiddo y asignar un delegado
let gestor = GestorPedidos()
let pedido = Pedido(estado: .procesando)
pedido.delegado = gestor

//cambiar el estado y notificar el delegado
pedido.cambiarEstado(nuevoEstado: .entregado)

/*Ejercicio 2: Funciones Estáticas y Clases
 Crear una clase Calculadora con funciones estáticas sumar y restar. Implementar
 una función que acepte un array de enteros y use las funciones estáticas para calcular la
 suma y la resta total de los elementos del array.*/


class Calculadora {
    //funcion estatica para sumar elementos del array
    static func sumar(a: Int, b: Int) -> Int {
        return a + b
    }
    
    //funcion para restar
    static func restar(a: Int, b: Int) -> Int {
        return a - b
    }
    
    // funcion que suma y resta y devuelve una tupla
    static func calcularSumaYResta(numeros: [Int]) -> (suma: Int, resta: Int) {
        // inicializar las variables
        var sumaTotal = 0, restaTotal = 0
        //recorrer el array y dar resultados
        for numero in numeros {
            sumaTotal = sumar(a: sumaTotal,b: numero)
            restaTotal = restar(a: restaTotal, b: numero)
        }
        
        return (sumaTotal, restaTotal)
    }
}

//implementacion
let numeros = [5,3,8,2,31,12,49,21]

let resultado = Calculadora.calcularSumaYResta(numeros: numeros)
print("La suma total es: \(resultado.suma)")
print("La resta total es: \(resultado.resta)")

/*Ejercicio 3: Polimorfismo y Structs
 Descripción: Crear un protocolo Figura con un método calcularArea. Implementar
 estructuras Cuadrado y Rectangulo que conformen al protocolo Figura. Crear una
 función que acepte un array de Figura y calcule el área total de todas las figuras.*/

//protocol Figura
protocol Figura {
    func calcularArea() -> Double
}

//struct Cuadrado
struct Cuadrado: Figura {
    var lado: Double
    
    func calcularArea() -> Double {
        return lado * lado
    }
}

//strcut rectagunlo
struct Rectangulo: Figura {
    var largo: Double
    var ancho: Double
    
    func calcularArea() -> Double {
        return largo * ancho
    }
}

//funcion para caclular las areas usando el polimorfismo en figura.calcularArea()
func areaTotalDeFiguras(figuras: [Figura]) -> Double {
    var areaTotal: Double = 0
    
    for figura in figuras{
        areaTotal += figura.calcularArea()
    }
    return areaTotal
    
}
// array de figuras
let figuras: [Figura] = [
    Cuadrado(lado: 13),
    Rectangulo(largo: 24, ancho: 35),
    Cuadrado(lado: 12),
    Rectangulo(largo: 43, ancho: 26)
]

print("El area total del array es: \(areaTotalDeFiguras(figuras: figuras)) m^2")


/*Ejercicio 4: Enums y Funciones Estáticas
 Implementar una enumeración OperacionMatematica con casos suma, resta,
 multiplicacion, y division. Crear una clase OperadorMatematico con una
 función estática realizarOperacion que acepte dos números y un caso de
 OperacionMatematica, y devuelva el resultado de la operación.*/

enum OperacionMatematica {
    case suma
    case resta
    case multiplicacion
    case division
}
class OperadorMatematico {
    // funcion para marchear los tipos de funcion y devolver el resultado
    static func realizarOperacion(num1: Double, num2: Double, operacion: OperacionMatematica) -> Double {
        switch operacion {
        case .suma:
            return num1 + num2
        case .resta:
            return num1 - num2
        case .multiplicacion:
            return num1 * num2
        case .division:
            //verificar que el divisor no es 0
            guard num2 != 0 else { return 0 }
            return num1 / num2
        }
    }
}

/*Ejercicio 5: Clases, Structs y Polimorfismo
 Crear un protocolo Empleado con un método calcularSalario. Implementar una
 clase EmpleadoBase y una estructura EmpleadoContrato que conformen al protocolo
 Empleado. Crear una función que acepte un array de Empleado y calcule el salario total
 de todos los empleados.*/

//protocol empleado e implementar calcularSalario
protocol Empleado {
    func calcularSalario() -> Double
}

// clase
class EmpleadoBase: Empleado {
    var salarioMensual: Double
    
    init(salarioMensual: Double) {
        self.salarioMensual = salarioMensual
    }
    
    func calcularSalario() -> Double {
        return salarioMensual
    }
}

// strcut empleadoContrato
struct EmpleadoContrato: Empleado {
    var pagoPorHora: Double
    var horasTrabajadas: Double
    
    func calcularSalario() -> Double {
        return pagoPorHora * horasTrabajadas
    }
}

//funcion que acepte un aray de empleados y devuelva el total
func salarioTotalDeEmpleados(empleados: [Empleado]) -> Double {
    var salarioTotal: Double = 0
    for empleado in empleados {
        salarioTotal += empleado.calcularSalario()
    }
    return salarioTotal
}

// Ejemplo de uso
let empleados: [Empleado] = [
    EmpleadoBase(salarioMensual: 3000),
    EmpleadoContrato(pagoPorHora: 20, horasTrabajadas: 160),
    EmpleadoBase(salarioMensual: 2500),
    EmpleadoContrato(pagoPorHora: 25, horasTrabajadas: 150)
]

let salarioTotal = salarioTotalDeEmpleados(empleados: empleados)
print("El salario de todos los trabajadores es: $\(salarioTotal)")

