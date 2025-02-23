"""
13. Implemente un programa que imprima una planilla de sueldos parciales y
completos de un conjunto de empleados, para esto considere que puede haber
una clase llamada Departamento la cual contiene un cierto número de
empleados de ambas categorías.
Diseñe su solución en Ruby.
"""

from abc import ABC, abstractmethod
import random

class Departamento:

    def __init__(self, nombre):
        self.__nombre = nombre
        self.__parciales = []
        self.__completos = []
    
    def nuevoEmpleado(self, empleado):
        if empleado.getCodigo()[:2] == 'TP':
            self.__parciales.append(empleado)
        elif empleado.getCodigo()[:2] == 'TC':
            self.__completos.append(empleado)
        else:
            pass
    
    def imprimirPlanilla(self):
        print(f'\n\n=============================={"="*len(self.__nombre)}\nPlanilla del departamento de {self.__nombre}:\n=============================={"="*len(self.__nombre)}\n')
        print("Sueldos parciales:")
        for i in range(len(self.__parciales)):
            print(f' - Empleado {self.__parciales[i].getCodigo()}: S/{self.__parciales[i].calcSueldo():.2f} ')
        print("\nSueldos completos:")
        for i in range(len(self.__completos)):
            print(f' - Empleado {self.__completos[i].getCodigo()}: S/{self.__completos[i].calcSueldo():.2f} ')

class Empleado(ABC):

    def __init__(self, codigo):
        self.__codigo = codigo

    @abstractmethod
    def calcSueldo(self):
        pass

    def getCodigo(self):
        return self.__codigo

class EmpParcial(Empleado):

    def __init__(self, horas, costoxhora, codigo):
        super().__init__(codigo)
        self.__horas = horas
        self.__costoxhora = costoxhora

    def calcSueldo(self):
        return self.__horas*self.__costoxhora    

class EmpCompleto(Empleado):

    def __init__(self, monto, anos, codigo):
        super().__init__(codigo)
        self.__monto = monto
        self.__anos = anos

    def calcSueldo(self):
        return self.__monto + self.__monto*0.2*self.__anos
    
def main():

    recursos_humanos = Departamento("Recursos Humanos (RRHH)")
    finanzas_contabilidad = Departamento("Finanzas y Contabilidad")
    ti = Departamento("Tecnología de la Información (TI)")
    marketing_ventas = Departamento("Marketing y Ventas")
    operaciones_logistica = Departamento("Operaciones y Logística")

    for i in range(random.randint(1,10)):
        recursos_humanos.nuevoEmpleado(EmpParcial(random.randint(0, (int)(48*4.33)), random.randint(10, 100), f'TP{(i + 1):04d}'))
    for i in range(random.randint(1,10)):
        recursos_humanos.nuevoEmpleado(EmpCompleto(random.randint(1130, 5000), random.randint(0, 50), f'TC{(i + 1):04d}'))
    for i in range(random.randint(1,10)):
        finanzas_contabilidad.nuevoEmpleado(EmpParcial(random.randint(0, (int)(48*4.33)), random.randint(10, 100), f'TP{(i + 1):04d}'))
    for i in range(random.randint(1,10)):
        finanzas_contabilidad.nuevoEmpleado(EmpCompleto(random.randint(1130, 5000), random.randint(0, 50), f'TC{(i + 1):04d}'))
    for i in range(random.randint(1,10)):
        ti.nuevoEmpleado(EmpParcial(random.randint(0, (int)(48*4.33)), random.randint(10, 100), f'TP{(i + 1):04d}'))
    for i in range(random.randint(1,10)):
        ti.nuevoEmpleado(EmpCompleto(random.randint(1130, 5000), random.randint(0, 50), f'TC{(i + 1):04d}'))
    for i in range(random.randint(1,10)):
        marketing_ventas.nuevoEmpleado(EmpParcial(random.randint(0, (int)(48*4.33)), random.randint(10, 100), f'TP{(i + 1):04d}'))
    for i in range(random.randint(1,10)):
        marketing_ventas.nuevoEmpleado(EmpCompleto(random.randint(1130, 5000), random.randint(0, 50), f'TC{(i + 1):04d}'))
    for i in range(random.randint(1,10)):
        operaciones_logistica.nuevoEmpleado(EmpParcial(random.randint(0, (int)(48*4.33)), random.randint(10, 100), f'TP{(i + 1):04d}'))
    for i in range(random.randint(1,10)):
        operaciones_logistica.nuevoEmpleado(EmpCompleto(random.randint(1130, 5000), random.randint(0, 50), f'TC{(i + 1):04d}'))

    recursos_humanos.imprimirPlanilla()
    finanzas_contabilidad.imprimirPlanilla()
    ti.imprimirPlanilla()
    marketing_ventas.imprimirPlanilla()
    operaciones_logistica.imprimirPlanilla()

if __name__ == "__main__":
    main()