"""
2. Añade un método distancia a la clase Punto que calcule la distancia entre el
punto actual y otro punto recibido como parámetro. La distancia entre dos puntos 
(x1, y1) y (x2, y2) se calcula con la fórmula: d = sqrt((x2 - x1)^2 + (y2 - y1)^2)
"""

import math

class Punto:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def distancia(self, otro_punto):
        return math.sqrt((otro_punto.x - self.x) ** 2 + (otro_punto.y - self.y) ** 2)

p1 = Punto(3, 4)
p2 = Punto(6, 8)
print(f"Distancia entre P1 y P2: {p1.distancia(p2)}")