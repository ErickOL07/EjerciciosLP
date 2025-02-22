"""
4. Mejora el programa agregando control de errores.
Asegúrate de que el usuario solo ingrese valores numéricos y maneja excepciones.
""" 

import math

class Punto:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def distancia(self, otro_punto):
        return math.sqrt((otro_punto.x - self.x) ** 2 + (otro_punto.y - self.y) ** 2)

def pedir_numero(mensaje):
    while True:
        try:
            return float(input(mensaje))
        except ValueError:
            print("Error: Ingrese un número válido.")

x1 = pedir_numero("Ingrese la coordenada x del primer punto: ")
y1 = pedir_numero("Ingrese la coordenada y del primer punto: ")
x2 = pedir_numero("Ingrese la coordenada x del segundo punto: ")
y2 = pedir_numero("Ingrese la coordenada y del segundo punto: ")

p1 = Punto(x1, y1)
p2 = Punto(x2, y2)

print(f"La distancia entre los puntos es: {p1.distancia(p2):.2f}")