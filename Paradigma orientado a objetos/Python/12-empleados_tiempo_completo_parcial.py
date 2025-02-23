"""
12. Los empleados de una compañía X son divididos en dos categorías:
empleados a tiempo parcial y empleados a tiempo completo. 

Los empleados a tiempo parcial su sueldo se calcula según el número de
horas trabajadas al mes por el costo por hora que determine la empresa.

Los empleados a tiempo completo reciben un monto mensual fijo el cual
es afecto a un bono igual al 20% de su sueldo por cada año trabajado.

Realice un programa usando clases abstractas que permita calcular el sueldo
de un par de empleados a tiempo parcial y a tiempo completo.

Se sugiere que los datos de los empleados sean generados de forma aleatoria.
Diseñe su solución en Python, C++ y Ruby.
"""

from abc import ABC, abstractmethod
import random

class Empleado(ABC):
    __metaclase__ = ABC

    def __init__(self):
        pass

    @abstractmethod
    def calcSueldo(self):
        pass

    @abstractmethod
    def toString(self):
        return f'{round(self.calcSueldo(),2):.2f}'

class EmpParcial(Empleado):

    def __init__(self, horas, costoxhora):
        self.__horas = horas
        self.__costoxhora = costoxhora

    def calcSueldo(self):
        return self.__horas*self.__costoxhora
    
    def toString(self):
        return f'Empleado\n - Tiempo parcial.\n - Sueldo: S/{super().toString()}'
    
class EmpCompleto(Empleado):

    def __init__(self, monto, anos):
        self.__monto = monto
        self.__anos = anos

    def calcSueldo(self):
        return self.__monto + self.__monto*0.2*self.__anos
    
    def toString(self):
        return f'Empleado\n - Tiempo completo.\n - Sueldo: S/{super().toString()}'
        
def main():
    l = []

    for _ in range(10):
        empleadop = EmpParcial(random.randint(0, (int)(48*4.33)), random.randint(10, 100))
        l.append(empleadop)
        empleadop = EmpCompleto(random.randint(1130, 5000), random.randint(0, 50))
        l.append(empleadop)

    print("\n=== Lista de Empleados===")
    for i in range(len(l)):
        print(f'{i + 1}. {l[i].toString()}')

if __name__ == "__main__":
    main()