"""
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
"""

Object subclass: Punto [
    | x y |

    "Constructor"
    Punto class >> nuevoX: xVal Y: yVal [
        ^self new initializeX: xVal Y: yVal.
    ]

    initializeX: xVal Y: yVal [
        x := xVal.
        y := yVal.
    ]

    "Método para calcular la distancia"
    distanciaA: otroPunto [
        | dx dy |
        dx := otroPunto obtenerX - x.
        dy := otroPunto obtenerY - y.
        ^ (dx squared + dy squared) sqrt.
    ]

    "Métodos privados para obtener las coordenadas"
    obtenerX [
        ^x.
    ]

    obtenerY [
        ^y.
    ]

    "Método para imprimir"
    imprimir [
        ^ '(' , x asString , ', ' , y asString , ')'.
    ]
]

"Programa Principal"
| p1 p2 |
p1 := Punto nuevoX: 3 Y: 5.
p2 := Punto nuevoX: 8 Y: 4.

Transcript show: 'La distancia entre P1 ', p1 imprimir, ' y P2 ', p2 imprimir, ' es ', (p1 distanciaA: p2) asString; cr.
