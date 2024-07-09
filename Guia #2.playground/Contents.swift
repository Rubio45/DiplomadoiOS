import UIKit


/*Escribe una función llamada calcularAreaYPerimetro que
acepte dos parámetros ancho y alto de tipo Double. La función debe devolver
una tupla con el área y el perímetro del rectángulo. Utiliza constantes para los
cálculos y llama a la función con valores de prueba, imprimiendo los resultados.*/

func calcularAreaYPerimetro(ancho: Double, alto: Double) -> (area: Double, perimetro: Double) {
    let area: Double = ancho * alto
    let perimetro: Double = 2 * (ancho + alto)
    // devolver una tupla con el area y el perimetro
    return (area: area, perimetro: perimetro)
}
// iniciar la variable con la funcion para imprimir el rsultado
let resultado = calcularAreaYPerimetro(ancho: 5, alto: 10)
print("El area es: \(resultado.area) m^2 y el perimetro es: \(resultado.perimetro)m")

/*Escribe una función llamada calcularAreaTriangulo que acepte
 tres parámetros a, b, y c de tipo Double representando los lados de un triángulo.
 La función debe validar si los lados forman un triángulo válido y, de ser así,
 calcular el área utilizando la fórmula de Herón. Devuelve nil si los datos no son
 válidos.*/
func calcularAreaTriangulo(a:Double, b:Double, c: Double) -> Double? {
    if a <= 0 || b <= 0 || c <= 0 || a + b <= c || a + c <= b || b + c <= a {
        print("Invalido")
        return nil
    }
    
    let perimetro: Double = (a + b + c)/2
    return sqrt(perimetro * (perimetro - a) * (perimetro - b) * (perimetro - c))
}
let areaTriangulo: Double? = calcularAreaTriangulo(a: 1, b: 7, c: 5)

print("El perimetro es de \(areaTriangulo ?? 0) m^2")

/*Escribe una función llamada calcularEstadisticas que acepte
 un array de enteros y devuelva una tupla con la media, mediana y moda del array.
 Implementa la lógica para calcular cada una de estas estadísticas y prueba la
 función con un array de ejemplo.*/

func calcularEstadisticas(numeros: [Int]) -> (media: Double, mediana: Double, moda: Double){
    var suma = (numeros.reduce(0, +))
    var mediana: Double
    var moda: Double
    // calcular el promedio
    let promedio: Double =  Double (suma / numeros.count)
    
    //ordenar los numeros para la mediana
    let numerosOrdenados = numeros.sorted()
    
    if numeros.count % 2 == 0 {
        //hice esta variable para luego pasarla a double abajo
        let PreMediana = (numerosOrdenados[numeros.count / 2] + numerosOrdenados[numeros.count / 2 - 1])/2
        mediana = Double(PreMediana)
    }else{
        //hice esta variable para luego pasarla a double abajo
        let PreMediana = numerosOrdenados[numeros.count / 2]
        mediana = Double(PreMediana)
    }

    //hacer la fecuencia de cada numero.
    var frecuencia = [Int : Int]()
    for numero in numeros{
        if frecuencia[numero] == nil {
            frecuencia[numero] = 0
        }
        frecuencia[numero]! += 1
    }
    moda = Double(frecuencia.values.max()!)
    
    print(frecuencia)
    // devolver todo media, mediana y moda
    return (media: promedio, mediana: mediana, moda: moda)
}

let (media, mediana, moda) = calcularEstadisticas(numeros: [2,3,1,2,93,2,4,6])



// Ejercicio 3

/*Escribe dos funciones, sumaMatrices y multiplicarMatrices,
que acepten dos matrices (arrays de arrays de enteros) y devuelvan la matriz
resultado de la suma y la multiplicación, respectivamente. Valida que las
dimensiones de las matrices sean compatibles para cada operación. Prueba las
funciones con matrices de ejemplo.*/

func sumaMatrices(matriz1: [[Int]], matriz2: [[Int]]) -> [[Int]]?{
    
    if matriz1.count != matriz2.count {
        print("No se pueden sumar las matriz")
        return nil
    }
    for row in 0..<matriz1.count {
        if matriz1[row].count == matriz2.count {
            print("No se pueden sumar las matriz")
            return nil
        }
    }
    //sumar las matrices usando los indices de las matrices. A[i][j] + B[i][j]
    var filaResultado: [Int] = []
    var matrizResultado: [[Int]] = []
    for row in 0..<matriz1.count{
        for column in 0..<matriz1[row].count{
            //haciendo una lista para agregarla a la matriz resultad
            filaResultado.append(matriz1[row][column] + matriz2[row][column])
        }
        //agregar lista a la matriz resultado y limpiando la lista para agregar mas columnas
        matrizResultado.append(filaResultado)
        filaResultado.removeAll()
    }
    print(matrizResultado)
    return matrizResultado
}

let suma = sumaMatrices(matriz1: [[1,2,3,4],[4,3,2,1]], matriz2:[[1,2,3,4],[4,3,2,1]])

func multiplicarMatriz(matriz1: [[Int]], matriz2: [[Int]]) -> [[Int]]? {
    //la primera debe tener el mismo número de columnas que filas la segunda
    
    // obtener la cantidad de filas y columnas de cada matriz
    let rows1 = matriz1.count
    let column1 = matriz1[0].count
    let rows2 = matriz2.count
    let column2 = matriz2[0].count
    var matrizResultado: [[Int]] = Array(repeating: Array(repeating: 0, count: column2), count: rows1)
    
    if column1 != rows2 {
        print("No se pueden multiplicar")
        return nil
    }
    // mutltiplicar matrices
    for i in 0..<rows1 {
        for j in 0..<column2{
            for k in 0..<column1{
                matrizResultado[i][j] += matriz1[i][k] * matriz2 [k][j]
            }
        }
    }
    
    
    print(matrizResultado)
    
    return matrizResultado
}

let producto = multiplicarMatriz(matriz1: [[1,3,5], [2,4,6]], matriz2: [[3,9,1],[3,4,1],[3,2,1]])



/*Ejercicio 1: Implementar un algoritmo de ordenamiento por selección
● Instrucción: Escribe una función llamada ordenarPorSeleccion que acepte un
array de enteros y lo ordene utilizando el algoritmo de ordenamiento por selección.
Implementa la lógica del algoritmo y prueba la función con un array de ejemplo.*/


// El proceso del proceso consiste en buscar el menor elemento e intercambiarlo por el elemento en la primera posición. Luego se busca el segundo elemento más pequeño del arreglo y se intercambia con el elemento de la segunda posición.


func ordenarPorSeleccion(numeros: inout [Int]){
    // obtener la cantidad de numeros que hay
    let cantidadNumeros = numeros.count
    // recorrer el arreglo
    for i in 0..<cantidadNumeros {
        var indice =  i
        // recorrer el array de nuevo para comparar los numeros
        for j in i+1..<cantidadNumeros{
            // si el numero es mayor, cambiar el indice para poner el menor al principio
            if numeros[j] < numeros[indice]{
                indice = j
            }
        }
        // hacer swap del indice
        if i != indice {
            numeros.swapAt(i, indice)
        }
    }
}
var numeros = [21,43,63,12,53,204,923,483,223]
ordenarPorSeleccion(numeros: &numeros)

print("Esta es la lista ordenada por seleccion: \(numeros)")


/*Implementar el algoritmo de búsqueda en profundidad (DFS) en un grafo
 ● Instrucción: Crea una clase Grafo que represente un grafo utilizando una lista de
 adyacencia. Escribe un método dfs que realice una búsqueda en profundidad
 (DFS) desde un nodo inicial y devuelva el recorrido. Implementa y prueba la
 función con un grafo de ejemplo.*/


// definir clase Grafo
class Grafo {
    var adjList: [Int:[Int]]
    init(adjList: [Int : [Int]]) {
        self.adjList = adjList
    }
    // añadir una arista
    func agregarArista(from: Int, to: Int){
        // si no existe, entonces añadir la clave al diccionario
        if adjList[from] == nil {
            adjList[from] = []
        }
        // si existe algun elemento, añadirlo al diccionario
        adjList[from]?.append(to)
    }
    // funcion de deepsearch que llama a la funcion deepFirstSearchUtil
    func depthFirstSearch(inicio: Int) -> [Int]{
        var visitados: Set<Int> = []
        var resultado: [Int] = []
        
        depthFirstSearchUtil(nodo: inicio, visitados: &visitados, resultado: &resultado)
        return resultado
    }
    // funcion privada que devuelve los vecinos de cada nodo
    private func depthFirstSearchUtil (nodo: Int, visitados: inout Set<Int>, resultado: inout [Int]) {
        visitados.insert(nodo)
        resultado.append(nodo)
        
        guard let vecinos = adjList[nodo] else { return }
            
        for vecino in vecinos {
            if !(visitados.contains(vecino)) {
                    depthFirstSearchUtil(nodo: vecino, visitados: &visitados, resultado: &resultado)
            }
        }
    }
}

let grafo = Grafo(adjList: [
    0: [1, 2],
    1: [2],
    2: [0, 3],
    3: [3]
])

let resultadoGrafo =  grafo.depthFirstSearch(inicio: 2)
print("DFS desde el nodo 2: \(resultadoGrafo)")


/*
 Ejercicio 1: Calcular la suma de los primeros N números utilizando recursión y no
 recursión
 ● Instrucción: Escribe dos funciones llamadas sumaRecursiva y
 sumaIterativa que calculen la suma de los primeros N números naturales. La
 primera función debe ser recursiva y la segunda iterativa. Prueba ambas funciones
 con un valor de ejemplo.
 */

// funcion recursiva de suma
func sumaRecursiva(n: Int) -> Int {
    if n==0 {
        return 0
    }else{
        // devuelve la misma funcion sumada a n con n-1 hasta que sea 0.
        return n + sumaRecursiva(n: n-1)
    }
}
let sumaRecursivaVar = sumaRecursiva(n: 5)
print(sumaRecursivaVar)

// funcion iterativa con un sumado
func sumaIterativa(n: Int) -> Int {
    var suma: Int = 0
    for i in 0...n {
        suma += i
    }
    return suma
}

let sumaIterativaVar = sumaIterativa(n: 5)
print(sumaIterativaVar)

// busqyeda binaria
func busquedaBinariaRecursiva(array: inout [Int], valor: Int, inicio: Int, final: Int) -> Int? {
    ordenarPorSeleccion(numeros: &array)
    if inicio > final {
        return nil
    }
    var medio = (inicio + final) / 2
    // buscar el valor medio, si es igual, entonces devolverlo.
    if valor == array[medio]{
        return medio
    }else if valor > array[medio] {
        // revisar si se mueve el inicio a la derecha o a la izquierda
        return busquedaBinariaRecursiva(array: &array, valor: valor, inicio: medio + 1, final: final)
    }else {
        return busquedaBinariaRecursiva(array: &array, valor: valor, inicio: inicio, final: medio - 1)
    }
}

var array: [Int] = [1,2,3,4,5,6,7,8,9,10,20,30]
//obtener el indice
let indiceBinario = busquedaBinariaRecursiva(array: &array, valor: 3, inicio: 0, final: array.count)
//imprimir el indice
if indiceBinario != nil {
    print("El valor esta en la posicion \(indiceBinario ?? 0)")
}else{
    print("No se pudo encontrar el valor")
}


/*Instrucción: Define una clase Coche con propiedades para marca, modelo y
 año. Implementa un método describir que devuelva una cadena con la
 descripción del coche. Crea una instancia de Coche y llama al método
 describir.*/

class Coche {
    let marca: String
    let modelo: String
    let annio: Int
    
    init(marca: String, modelo: String, annio: Int) {
        self.marca = marca
        self.modelo = modelo
        self.annio = annio
    }
    //funcion descripcion
    func descripcion(){
        print("Soy un \(marca) \(modelo) del \(annio)")
    }
}

let miCarro = Coche(marca: "Hyundai", modelo: "Grand i10", annio: 2025)
miCarro.descripcion()


/*Define un struct Rectángulo con propiedades para ancho y alto.
 Implementa métodos para calcular el área y el perímetro. Crea una instancia de
 Rectángulo y llama a los métodos para imprimir el área y el perímetro.*/

struct Rectangulo {
    let ancho: Double
    let alto: Double
    
    func calcularArea() -> Double {
        return alto * ancho
    }
    
    func calcularPerimetro() -> Double {
        return 2 * (alto + ancho)
    }
}
let miRectangulo = Rectangulo(ancho: 5, alto: 5)
print("El area es: \(miRectangulo.calcularArea()) m^2")
print("El perimetro es: \(miRectangulo.calcularPerimetro()) m")

/*● Instrucción: Define un protocolo Volable con un método volar. Crea dos
 clases Pájaro y Avión que conformen al protocolo Volable. Implementa el
 método volar en ambas clases con una implementación específica para cada
 una. Crea instancias de ambas clases y llama al método volar.*/

protocol Volable {
    func volar()
}

class Pajaro: Volable {
    func volar() {
        print("El pajaro esta volando")
    }
}

class Avion: Volable {
    func volar() {
        print("Voy a encender los motores para volar")
    }
}
