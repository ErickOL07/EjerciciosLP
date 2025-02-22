"""
6. Modifique el código de la pregunta anterior de tal manera que exista una
operación denominada incremento() que pertenezca a la clase ListaEmpleados.
Esta operación aumenta el salario de cada empleado en un 10%, hacer que su
programa imprima los salarios originales y los incrementados de todos los
trabajadores. Desarrolle dos soluciones en C++, una versión no deberá usar
punteros y la otra versión deberá usar punteros a fin de agregar los datos y un
destructor para liberar memoria.
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

    def getCodigo(self):
        return self.__codigo
    
    def setCodigo(self, codigo):
        self.__codigo = codigo
    
    def getNombre(self):
        return self.__nombre
    
    def setNombre(self, nombre):
        self.__nombre = nombre
    
    def getSalario(self):
        return self.__salario
    
    def setSalario(self, salario):
        self.__salario = salario

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

    def incremento(self):
        for empleado in self.__listaEmp:
            empleado.setSalario(round(empleado.getSalario()*1.10, 1))
            
        
def main():
    l = ListaEmpleados()

    for _ in range(10):
        empleado = Empleado()
        empleado.generar()
        l.agregar(empleado)
    
    l.impEmpleados()

    l.incremento()

    l.impEmpleados()

if __name__ == "__main__":
    main()