"""
3. Modifica el código para que el usuario pueda ingresar los valores de los
puntos en lugar de definirlos manualmente.
"""
import math

class Punto:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def distancia(self, otro_punto):
        return math.sqrt((otro_punto.x - self.x) ** 2 + (otro_punto.y - self.y) ** 2)

x1 = float(input("Ingrese la coordenada x del primer punto: "))
y1 = float(input("Ingrese la coordenada y del primer punto: "))
x2 = float(input("Ingrese la coordenada x del segundo punto: "))
y2 = float(input("Ingrese la coordenada y del segundo punto: "))

p1 = Punto(x1, y1)
p2 = Punto(x2, y2)

print(f"La distancia entre los puntos es: {p1.distancia(p2)}")