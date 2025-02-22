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
        self.__codigo = random.randint(100, 900)  # Código aleatorio entre 100 y 900
        self.__nombre = chr(random.randint(65, 90))  # Letra aleatoria entre A-Z
        self.__salario = random.randint(113, 1000) * 10  # Salario aleatorio múltiplo de 10

    def get_salario(self):
        return self.__salario

    def set_salario(self, nuevo_salario):
        self.__salario = nuevo_salario

    def __str__(self):
        return f'- Código: {self.__codigo}\n - Nombre: {self.__nombre}\n - Salario: S/{self.__salario}\n'


class ListaEmpleados:
    def __init__(self):
        self.__listaEmp = []

    def agregar(self, empleado):
        self.__listaEmp.append(empleado)

    def impEmpleados(self):
        for i, empleado in enumerate(self.__listaEmp, start=1):
            print(f'Empleado {i}:')
            print(empleado)

    def incremento(self):
        print("\n=== Incremento Salarial del 10% ===")
        for empleado in self.__listaEmp:
            salario_anterior = empleado.get_salario()
            nuevo_salario = round(salario_anterior * 1.10, 2)  # Aumento del 10%
            empleado.set_salario(nuevo_salario)
            print(f'Salario anterior: S/{salario_anterior} -> Nuevo salario: S/{nuevo_salario}')
        print("===================================\n")


# Programa principal
def main():
    lista = ListaEmpleados()

    # Generar y agregar 10 empleados
    for _ in range(10):
        empleado = Empleado()
        empleado.generar()
        lista.agregar(empleado)

    # Imprimir empleados antes del aumento
    print("\n=== Lista de Empleados Original ===")
    lista.impEmpleados()

    # Aplicar incremento del 10%
    lista.incremento()

    # Imprimir empleados después del aumento
    print("\n=== Lista de Empleados con Salario Incrementado ===")
    lista.impEmpleados()


if __name__ == "__main__":
    main()
