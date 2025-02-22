"""
5. Refactoriza el código en una estructura más modular,
dividiendo las responsabilidades en funciones.
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

def obtener_punto():
    x = pedir_numero("Ingrese la coordenada x: ")
    y = pedir_numero("Ingrese la coordenada y: ")
    return Punto(x, y)

def main():
    print("Ingrese el primer punto:")
    p1 = obtener_punto()
    print("Ingrese el segundo punto:")
    p2 = obtener_punto()

    print(f"La distancia entre los puntos es: {p1.distancia(p2):.2f}")

if __name__ == "__main__":
    main()