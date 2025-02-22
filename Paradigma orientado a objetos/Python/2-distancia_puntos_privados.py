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

import math

class Punto:
    def __init__(self, x, y):
        self.__x = x
        self.__y = y

    def distancia(self, puntoB):
        return math.sqrt((puntoB.__x - self.__x)**2 + (puntoB.__y - self.__y)**2)

def main():
    p1 = Punto(3, 5)
    p2 = Punto(8, 4)

    print(f'La distancia entre P1 ({p1.x}, {p1.y}) y P2 ({p2.x}, {p2.y}) es {p1.distancia(p2)}.')

if __name__ == "__main__":
    main()