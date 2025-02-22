"""
1. Crea una clase Punto que represente un punto en un plano cartesiano con coordenadas (x, y). 
La clase debe tener un constructor para inicializar los valores de x y y.
"""

class Punto:
    def __init__(self, x, y):
        self.x = x
        self.y = y

p1 = Punto(3, 4)
print(f"Punto 1: ({p1.x}, {p1.y})")