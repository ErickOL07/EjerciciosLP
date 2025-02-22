"""
4. Escriba un programa que pida al usuario el ingreso de un número entero
positivo de tal manera que imprima todos los números primos hasta ese
número. Cree una clase denominada Pila (stack) la cual almacene estos
números primos y que luego imprima estos elementos en orden inverso.
Para este programa puede utilizar la estructura de datos list de Python así
como la instrucción pop(pos), esta instrucción devuelve el dato que almacena
una lista dada una posición determinada. Desarrollar su solución en Python.
Hacer su implementación en Python, C++ y Ruby.
"""

class Pila:
    def __init__(self):
        self.elementos = []

    def apilar(self, elemento):
        self.elementos.append(elemento)

    def desapilar(self):
        if self.elementos:
            return self.elementos.pop()
        return None

    def imprimir_inverso(self):
        while self.elementos:
            print(self.desapilar(), end=" ")
        print()

def es_primo(numero):
    if numero < 2:
        return False
    for i in range(2, int(numero ** 0.5) + 1):
        if numero % i == 0:
            return False
    return True

n = int(input("Ingrese un número entero positivo: "))

if n <= 0:
    print("Por favor, ingrese un número entero positivo.")
else:
    pila_primos = Pila()
    
    for num in range(2, n + 1):
        if es_primo(num):
            pila_primos.apilar(num)
    
    print("Números primos en orden inverso:")
    pila_primos.imprimir_inverso()