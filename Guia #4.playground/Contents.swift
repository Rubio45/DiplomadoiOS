import UIKit


/*Ejercicio 1: Crea una clase CuentaBancaria con una propiedad saldo. Utiliza didSet
para imprimir un mensaje cada vez que el saldo cambie.*/

final class MiCuenta {
    var saldo: Int = 0 {
        didSet{
            //avisar que ya se cambio el valor
            print("El nuevo valor sera \(saldo)")
        }
    }
}

var miSaldo = MiCuenta()
miSaldo.saldo = 124

/*
 Ejercicio 2: Implementa una clase Temperatura con una propiedad celsius. Usa
 didSet para actualizar una propiedad fahrenheit cada vez que celsius cambie.
 */

//implementar una clase final para que se acelere el periodo de compilado. El profe dijo que todas las clases debian ser Finales
final class Temperatura {
    var temperaturaFahrenheit: Double = 0
    var temperaturaCelsius: Double = 0 {
        didSet{
            // calcular la temp en Fahrenheit y avisar con prints
            print("La nueva temperatura es \(temperaturaCelsius) celsius")
            temperaturaFahrenheit = (temperaturaCelsius * 9 / 5) + 32
            print("La nueva temperatura es \(temperaturaFahrenheit) fahrenheit")
        }
    }
}
// instanciar el objeto y asignarle un valor
var temperatura = Temperatura()
temperatura.temperaturaCelsius = 10

/*Función mutating en structs
 Ejercicio 1: Define una struct Rectangulo con propiedades ancho y alto. Implementa
 un método mutating llamado cambiarDimensiones que permita cambiar ambos
 valores.*/
struct Rectangulo {
    var ancho: Int
    var alto: Int
    // usar mutating para cambiar las dimensiones del rectangulo
    mutating func cambiarDimensiones(ancho: Int, alto: Int) {
        self.ancho = ancho
        self.alto = alto
    }
}

var rectangulo = Rectangulo(ancho: 10, alto: 10)
rectangulo.cambiarDimensiones(ancho: 20, alto: 20)

/*Ejercicio 2: Crea una struct Vector con propiedades x e y. Implementa un método
 mutating llamado mover que traslade el vector por un desplazamiento dado.*/

struct Vector {
    // iniciar los valores del vector
    var x: Int
    var y: Int
    //funcion para hacer que el vector se mueva
mutating func mover(desplazamiento: (Int, Int)) {
    // con .0 y .1 accedo a los valores valores de la tupla y sumo a los existentes en x y y.
    self.x += desplazamiento.0
    self.y += desplazamiento.1
    print("El vector se ha movido. Las nuevas coordenadas son \(x) y \(y)")
    }
}
// inicializandoe el vector y cambiando las posiciones
var vector = Vector(x: 13, y: 12)
vector.mover(desplazamiento: (3, 12))

/*Modificadores getter y setter
 Ejercicio 1: Implementa una clase Circulo con una propiedad radio y una propiedad
 calculada area que usa getter y setter.*/

class Circulo {
    var radio: Double = 0
    
    var area: Double {
        get{
            // con DOuble.pi se saca el area del Circulo teniendo el radio
            return Double.pi * radio * radio
        }
        // de la raiz cuadrada del area del circulo estoy sacando el radio
        set{
            radio = sqrt(newValue / Double.pi)
        }
    }
}

//iniciando el ciruclo y seteando el radio  para pbtener el area
let myCirculo =  Circulo()
myCirculo.radio = 10

print("El area del circulo es: \(myCirculo.area) cm^2")

/*Ejercicio 2: Crea una struct Rectangulo con propiedades ancho y alto. Implementa
una propiedad calculada perimetro con getter y setter.*/

// uso nuevo rectagulo porque ya use rectangulo arriba
struct nuevoRectangulo {
    var ancho: Int
    var alto: Int
    
    // iniciar el perimetro teniendo el ancho y el alto en modo de solo lectura
    var perimetro: Int {
        get{
            return (ancho + alto) * 2
        }
        // cuando el perimetro es seteado, se actualizan los valores de ancho y de largo del rectagulo
        set {
            //esto no tiene ningun sentido matematico. Cuando un rectangulo cambia de perimetro, el ancho y el alto cambian tambien
            // pero no necesariamente se cambian igual. Esto esta definiendo un cuadrado. para calcular un ancho y largo necesito tener al menos uno de ellos
            ancho = newValue / 4
            alto = newValue / 4
        }
    }
}
/*Closures
 Ejercicio 1: Escribe un closure que ordene un array de enteros en orden descendente y
 utilízalo para ordenar un array dado.*/

let closure = { (a: Int, b: Int ) -> Bool in
    if a > b {// devolver true or false dependiendo como sean a o B.
        return true
    } else {
        return false
    }
}
var array = [2, 3, 1, 4, 5]
array.sort(by: closure) // ordenar los numeros del array
print(array)

/*Ejercicio 2: Crea un closure que calcule el factorial de un número dado y utilízalo para
calcular el factorial de 5.*/

var closureFactorial =  { (num: Int) -> Int in
    // verifica que el numero no sea 0 o 1, ya que el factorial de 0 y de 1 es 1
    if num == 0 || num == 1 {
        return 1
    }
    // llamar al closure de forma recursiva para calcular el factorial
    return num * closureFactorial(num - 1)
}
// iniciar el closure y calcular para 5
print("El factorial de 5 es : \(closureFactorial(5))")
