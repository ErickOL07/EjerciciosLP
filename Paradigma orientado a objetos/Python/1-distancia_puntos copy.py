"""
1. Desarrollar un programa que permita inicializar dos puntos en un plano con
coordenadas (x,y) y que calcule la distancia entre dichos puntos. Desarrollar su
solución en Python.
"""

import math

class Punto:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def distancia(self, puntoB):
        return math.sqrt((puntoB.x - self.x)**2 + (puntoB.y - self.y)**2)

def main():
    p1 = Punto(3, 5)
    p2 = Punto(8, 4)

    print(f'La distancia entre P1 ({p1.x}, {p1.y}) y P2 ({p2.x}, {p2.y}) es {p1.distancia(p2)}.')

if __name__ == "__main__":
    main()
