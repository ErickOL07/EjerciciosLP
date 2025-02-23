# Importamos el módulo 'abc', que nos permite definir clases abstractas en Python.
from abc import ABC, abstractmethod

# Definimos una clase llamada 'Figura', que será una clase base para otras figuras geométricas.
class Figura:
    __metaclase__ = ABC  # Indicamos que esta clase sigue el modelo de clase abstracta.

    # Método constructor de la clase. Se ejecuta cuando se crea un objeto de esta clase.
    def __init__(self):
        pass  # No hacemos nada en este constructor, ya que esta clase es solo una base.

    # Decorador '@abstractmethod' indica que este método debe ser implementado por las clases hijas.
    @abstractmethod
    def calcArea(self):
        pass  # No tiene implementación aquí porque es obligatorio que las clases hijas lo definan.

# Definimos una clase 'Cuadrado' que hereda de 'Figura'.
class Cuadrado(Figura):
    # Método constructor que recibe el tamaño de un lado del cuadrado.
    def __init__(self, lado):
        self.lado = lado  # Guardamos el valor del lado en un atributo de la clase.

    # Implementamos el método 'calcArea', obligatorio por ser una subclase de 'Figura'.
    def calcArea(self):
        return self.lado * self.lado  # Calculamos el área del cuadrado: lado * lado.

# Definimos una clase 'Rectangulo' que también hereda de 'Figura'.
class Rectangulo(Figura):
    # Método constructor que recibe el ancho (a) y el alto (b) del rectángulo.
    def __init__(self, a, b):
        self.a = a  # Guardamos el ancho en un atributo.
        self.b = b  # Guardamos el alto en otro atributo.

    # Implementamos el método 'calcArea', obligatorio por ser una subclase de 'Figura'.
    def calcArea(self):
        return self.a * self.b  # Calculamos el área del rectángulo: ancho * alto.

# Definimos la función 'main', que es el punto de entrada del programa.
def main():
    # Creamos un objeto de la clase 'Cuadrado' con un lado de 5 unidades.
    objC = Cuadrado(5)
    # Imprimimos el área del cuadrado usando el método 'calcArea'.
    print("Área del cuadrado:", objC.calcArea())

    # Creamos un objeto de la clase 'Rectangulo' con un ancho de 3 y una altura de 4.
    objR = Rectangulo(3, 4)
    # Imprimimos el área del rectángulo usando el método 'calcArea'.
    print("Área del rectángulo:", objR.calcArea())

# Llamamos a la función 'main' para ejecutar el programa.
main()
