"""
5. Crear una clase llamada Empleado que incluya la siguiente información como
variables de instancia:
- Código
- Nombre
- Salario
Cree objetos del tipo empleado con variables de instancia de tipo públicas o
privadas, esta clase deberá contener un método que genere el código, la letra
del nombre del empleado y su sueldo al azar; puede usar la instrucción
siguiente:
from random import random
random()
Programe otra clase que permita agregar a una lista un conjunto de empleados.
Del mismo modo, codifique un programa principal que mediante un bucle
genere 10 empleados y los agregue a la lista de la clase anteriormente definida.
Su esquema de clases deberá ser el siguiente:
Para el código del empleado genere un número aleatorio entre 100 y 900. En el
caso del nombre del empleado puede generar al azar la primera letra del
apellido, para este caso considere que la letra A se representa por el número 65,
la B por el 66 y así sucesivamente. El dato del sueldo puede ser generado al
azar igualmente.
"""

import random

class Empleado:

    def __init__(self):
        self.__codigo = None
        self.__nombre = None
        self.__salario = None
    
    def generar(self):
        self.__codigo = random.randint(100, 900)
        self.__nombre = chr(random.randint(65,90))
        self.__salario = random.randint(113, 1000)*10

    def __str__(self):
        return f'- Código: {self.__codigo}\n - Nombre: {self.__nombre}\n - Salario: S/{self.__salario}\n'

class ListaEmpleados:

    def __init__(self):
        self.__listaEmp = []
    
    def agregar(self, empleado):
        self.__listaEmp.append(empleado)

    def impEmpleados(self):
        s = ""; c = 1
        for empleado in self.__listaEmp:
            s += f'Empleado {c}:\n {empleado}\n'
            c += 1
        print(s)
        
def main():
    l = ListaEmpleados()

    for _ in range(10):
        empleado = Empleado()
        empleado.generar()
        l.agregar(empleado)
    
    l.impEmpleados()

if __name__ == "__main__":
    main()