"""
17. Implementar el algoritmo de map reduce para conteo de palabras en un
texto, mida su tiempo de la parte del reduce de forma secuencial y luego en
forma paralela.
"""

import multiprocessing as mp
import time


def contarPalabras(texto):
    palabras = texto.split()
    return len(palabras)

# Función de mapeo: Tokeniza el texto y cuenta palabras en cada fragmento
def map_function(text_fragment):
    word_count = {}
    for word in text_fragment.split():
        word = word.lower()
        word_count[word] = word_count.get(word, 0) + 1
    return word_count

# Función de reducción secuencial
def reduce_sequential(word_counts):
    final_count = {}
    for wc in word_counts:
        for word, count in wc.items():
            final_count[word] = final_count.get(word, 0) + count
    return final_count

# Función de reducción en paralelo
def reduce_parallel(word_counts):
    with mp.Pool(processes=mp.cpu_count()) as pool:
        while len(word_counts) > 1:
            word_counts = pool.map(merge_dicts, [(word_counts[i], word_counts[i + 1]) 
                                                 for i in range(0, len(word_counts) - 1, 2)])
    return word_counts[0] if word_counts else {}

# Función auxiliar para fusionar dos diccionarios de conteo de palabras
def merge_dicts(dict_pair):
    dict1, dict2 = dict_pair
    merged = dict1.copy()
    for word, count in dict2.items():
        merged[word] = merged.get(word, 0) + count
    return merged

# Función para sumar palabras en paralelo
def suma(text):
    return contarPalabras(text)


def main():

    texto = """1
Ejercicios OOP
Paradigma Orientado a Objetos
1. Desarrollar un programa que permita inicializar dos puntos en un plano con
coordenadas (x,y) y que calcule la distancia entre dichos puntos. Desarrollar su
solución en Python.
2. Modifique su programa anterior de tal forma que las atributos de la clase se
encuentren de forma privada. Desarrolle su solución en Python, C++, Ruby y
Smalltalk. Compare sus soluciones.
Nota: Recuerde que no es un curso de Python, C++ o Ruby, la sintaxis la
puede conseguir de cualquier libro. Se podrá cambiar de lenguaje en cualquier
momento del curso.
En el caso de Ruby y Python puede usar el siguiente compilador en línea:
https://www.onlinegdb.com/online_ruby_compiler
Para el caso de C++ puede ser CodeBlocks o algún compilador en línea.
En el caso de SmallTalk el siguiente compilador puede servir:
https://www.tutorialspoint.com/execute_smalltalk_online.php
3. Un monomio es una expresión algebraica que tiene la siguiente forma:
𝑐𝑥
𝑛
Defina una clase polinomio la cual contenga un método que permita agregar los
monomios a una lista y que luego imprima el polinomio respectivo. Su
programa deberá ser llamado, desde un programa principal, de la siguiente
forma:
obj1=Monomio(3,"x",4)
obj2=Monomio(-2,"x",5)
obj3=Monomio(5,"x",-4)
p=Polinomio()
p.agregar(obj1)
p.agregar(obj2)
p.agregar(obj3)
p.imprimirP()
2
El polinomio podrá ser impreso de la siguiente forma: 3x**4+ -2x**5+ 5x**-4+
Puede usar al final de un print la instrucción end=” “ a fin de que no imprima
cada dato en una línea distinta.
4. Escriba un programa que pida al usuario el ingreso de un número entero
positivo de tal manera que imprima todos los números primos hasta ese
número. Cree una clase denominada Pila (stack) la cual almacene estos
números primos y que luego imprima estos elementos en orden inverso.
Para este programa puede utilizar la estructura de datos list de Python así
como la instrucción pop(pos), esta instrucción devuelve el dato que almacena
una lista dada una posición determinada. Desarrollar su solución en Python.
Hacer su implementación en Python, C++ y Ruby.
5. Crear una clase llamada Empleado que incluya la siguiente información como
variables de instancia:
- Código
- Nombre
- Salario
Cree objetos del tipo empleado con variables de instancia de tipo públicas o
privadas, esta clase deberá contener un método que genere el código, la letra
del nombre del empleado y su sueldo al azar; puede usar la instrucción
siguiente:
from random import random
random()
Programe otra clase que permita agregar a una lista un conjunto de empleados.
Del mismo modo, codifique un programa principal que mediante un bucle
genere 10 empleados y los agregue a la lista de la clase anteriormente definida.
Su esquema de clases deberá ser el siguiente:
3
Para el código del empleado genere un número aleatorio entre 100 y 900. En el
caso del nombre del empleado puede generar al azar la primera letra del
apellido, para este caso considere que la letra A se representa por el número 65,
la B por el 66 y así sucesivamente. El dato del sueldo puede ser generado al
azar igualmente.
6. Modifique el código de la pregunta anterior de tal manera que exista una
operación denominada incremento() que pertenezca a la clase ListaEmpleados.
Esta operación aumenta el salario de cada empleado en un 10%, hacer que su
programa imprima los salarios originales y los incrementados de todos los
trabajadores. Desarrolle dos soluciones en C++, una versión no deberá usar
punteros y la otra versión deberá usar punteros a fin de agregar los datos y un
destructor para liberar memoria.
7. Un pixel es igual a un punto con coordenadas (x,y) con la única diferencia
que un pixel contiene también un color, por ejemplo (x,y,”rojo”). Desarrollar un
programa que permita hallar la distancia entre dos pixels usando el programa
del punto desarrollado anteriormente. Implementar su solución en C++ y
Ruby.
8. Implementar una clase llamada Pila, la cual tenga las operaciones de
apilar(n), desapilar() y esVacia() la cual deberá ser formada a partir de una
clase denominada ListaArreglo. La clase Lista tendrá las operaciones de
agregarElemento(n), borrarElemento(pos) y utilizará como estructura de datos
del tipo list. Solamente podrá utilizar las siguientes operaciones de listas en
Python():
pop(): elimina un elemento de una lista dada en una posición determinada
4
append(n): agrega un elemento a la lista
9. Implementar una clase llamada Cola basado en el ADT Cola, con
operaciones de encolar y decolar. Basarse en la clase lista del programa
anterior, pero primero convierta su solución del problema 8 a C++.
10. Siguiendo el esquema dado para Herencia Múltiple resuelva el siguiente
caso: En algunas facultades los alumnos con mejores promedios son nombrados
asistentes de curso, es decir que cumplen algunas funciones del profesor del
curso como pudiera ser el dictado de las prácticas del curso. Se nos solicita un
programa de tal manera que se puedan imprimir los cursos que lleva un
estudiante, los cursos que dicta (o lleva) un profesor, y los cursos que dicta y
lleva un asistente de curso. Puede basarse en el siguiente esquema de clases:
5
(figura creada con: https://www.smartdraw.com/uml-diagram/uml-diagram-tool.htm)
11. En algunas ocasiones se menciona que la herencia múltiple puede ser la
consecuencia de un mal diseño, debido a esto se le solicita cambiar su programa
de la pregunta anterior a fin que tan sólo se utilice herencia simple.
Nota: Puede utilizar herencia con una clase y asociación con la otra.
Diseñe su solución en Ruby.
12. Los empleados de una compañía X son divididos en dos categorías:
empleados a tiempo parcial y empleados a tiempo completo. Los empleados a
tiempo completo reciben un monto mensual fijo el cual es afecto a un bono
igual al 20% de su sueldo por cada año trabajado. Los empleados a tiempo
parcial su sueldo se calcula según el número de horas trabajadas al mes por el
6
costo por hora que determine la empresa. Realice un programa usando clases
abstractas que permita calcular el sueldo de un par de empleados a tiempo
parcial y a tiempo completo. Se sugiere que los datos de los empleados sean
generados de forma aleatoria.
Diseñe su solución en Python, C++ y Ruby.
13. Implemente un programa que imprima una planilla de sueldos parciales y
completos de un conjunto de empleados, para esto considere que puede haber
una clase llamada Departamento la cual contiene un cierto número de
empleados de ambas categorías.
Diseñe su solución en Ruby.
14. Siga los pasos que a continuación se describen:
a) Cree una clase abstracta llamada PoliticaDescuento. Esta clase deberá
tener un solo método abstracto llamado calculaDescuento, el cual retornará el
descuento por la compra de un número determinado de un artículo en
particular. El método tiene dos parámetros, cantidad y costoArticulo.
b) Derive una clase llamada DescuentoBloque de PoliticaDescuento. Esta
clase deberá tener un constructor con dos parámetros: mínimo y porcentaje. El
método calculaDescuento funcionará del siguiente modo, si la cantidad
adquirida de un artículo es mayor a un mínimo, el descuento será de un
porcentaje dado por la variable respectiva.
c) Derive una clase llamada CompreNArticulosConsigaUnoGratis de
Politica Descuento. Esta clase deberá de tener un constructor que tiene un solo
parámetro n. Esta clase implementará el método calculaDescuento de tal modo
que cada n artículo es gratis. Por ejemplo, la siguiente tabla da los descuentos
para la compra de varias cantidades de un artículo que cuesta $10, cuando n es
3:
Cantidad 1 2 3 4 5 6 7
Descuento 0 0 10 10 10 20 20
d) Derive una clase llamada DescuentoCombinado de PoliticaDescuento.
Su constructor tendrá dos parámetros de tipo PoliticaDescuento. Ésta deberá
7
implementar el método calculaDescuento para cada una de sus políticas de
descuento. Las políticas de descuento se encuentran en los ejercicios 5 y 6.
Adicionalmente cree un arreglo de objetos del tipo PoliticaDescuento e imprima
los descuentos respectivos de cada objeto.
Para el ejercicio planteado puede utilizar Herencia, Clases Abstractas o
Asociación según lo considere conveniente.
Desarrolle su solución en Python y C++.
15. Programe en C++ una clase Padre y una clase Hija las cuales están
relacionadas por Herencia. Realizar los siguientes pasos:
a) La clase Padre tendrá un atributo a, con un constructor que permita
inicializar dicha variable.
b) La clase Hija deberá tener dos atributos c,d los cuales son inicializados
mediante su constructor. Aparte, uno de los valores que reciba el constructor
deberá ser enviado al constructor de la clase padre.
c) La clase Padre deberá tener una función que imprime el valor de su atributo
a.
d) La clase Hija deberá también tener una función imprimir que imprima el
valor de sus atributos c, d.
e) Cree una función llamada funcA la cual reciba un objeto de la clase padre y
que llame a la función imprimir.
f) En su función principal cree un objeto de la clase padre, un objeto d ela clase
hija y envíe a la función funcA primero el objeto Padre y luego, mediante otra
llamada a esta función, el objeto de la clase Hija. Observe que sucede con las
variables impresas.
En caso de existir object slicing modificar su función funcA de tal manera que
reciba un puntero a un objeto de la clase padre. Observe sus resultados.
Programación Concurrente y Paralela
16. Inicialice una lista o arreglo unidimensional con números al azar
comprendidos entre 1 y un millón. Su programa deberá sumar los elementos de
este arreglo haciendo uso de una función que los sume secuencialmente, y otra
8
función que sume estos elementos usando paralelismo. Para la parte de
paralelismo se sugiere que prueba su programa usando threads y luego los
procesadores disponibles en su computador, comparando los resultados de la
versión secuencial con las versiones paralelas.
17. Implementar el algoritmo de map reduce para conteo de palabras en un
texto, mida su tiempo de la parte del reduce de forma secuencial y luego en
forma paralela."""

    inicio = time.time() 
    print(f'Contar palabras secuencial: {contarPalabras(texto)}')
    fin = time.time() 
    print(f'Tiempo de ejecución: {fin - inicio} segundos.\n')

    # Contar palabras usando map-reduce secuencial
    num_cores = mp.cpu_count()
    tamaño_chunk = len(texto) // num_cores
    chunks = [texto[i:i + tamaño_chunk] for i in range(0, len(texto), tamaño_chunk)]

    mapped_values = list(map(map_function, chunks))
    inicio = time.time()
    print(f'Contar palabras reduce secuencial iniciado.')
    fin = time.time()
    print(f'Tiempo de reducción secuencial: {fin - inicio} segundos.\n')

    # Contar palabras usando map-reduce en paralelo
    pool = mp.Pool(processes=num_cores)
    mapped_values = pool.map(map_function, chunks)
    inicio = time.time()
    reduce_parallel(mapped_values)
    print(f'Contar palabras reduce paralela inciado.')
    fin = time.time()
    pool.close()
    pool.join()
    print(f'Tiempo de reducción paralela: {fin - inicio} segundos.\n')
if __name__ == "__main__":
    main()