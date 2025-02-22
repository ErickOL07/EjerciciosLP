"""
7. Un pixel es igual a un punto con coordenadas (x,y) con la única diferencia
que un pixel contiene también un color, por ejemplo (x,y,”rojo”). Desarrollar un
programa que permita hallar la distancia entre dos pixels usando el programa
del punto desarrollado anteriormente. Implementar su solución en C++ y
Ruby.
"""

import math

class Pixel:

    def __init__(self, x, y, color):
        self.__coloresRGB = {
            "rojo": (255, 0, 0),
            "verde": (0, 255, 0),
            "azul": (0, 0, 255),
            "amarillo": (255, 255, 0),
            "cian": (0, 255, 255),
            "magenta": (255, 0, 255),
            "negro": (0, 0, 0),
            "blanco": (255, 255, 255),
            "gris": (128, 128, 128),
            "naranja": (255, 165, 0),
            "morado": (128, 0, 128),
            "rosado": (255, 192, 203),
            "marrón": (165, 42, 42)
        }
        self.__x = x
        self.__y = y
        self.__color = self.__coloresRGB[color]

    def getX(self):
        return self.__x
    
    def getY(self):
        return self.__y
    
    def getColor(self):
        return self.__color
    
    def distancia(self, pixelB):
        return f'{round(math.sqrt((pixelB.__x - self.__x)**2 + (pixelB.__y - self.__y)**2), 5)} ({abs(pixelB.__color[0] - self.__color[0])}, {abs(pixelB.__color[1] - self.__color[1])}, {abs(pixelB.__color[2] - self.__color[2])})'
    
def main():
    p1 = Pixel(3, 5, "rojo")
    p2 = Pixel(8, 4, "verde")

    print(f'La distancia entre P1 ({p1.getX()}, {p1.getY()}, {p1.getColor()}) y P2 ({p2.getX()}, {p2.getY()}, {p2.getColor()}) es {p1.distancia(p2)}.')

if __name__ == "__main__":
    main()