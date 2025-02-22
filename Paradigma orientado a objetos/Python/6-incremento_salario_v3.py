"""
6. Modifique el código de la pregunta anterior de tal manera que exista una
operación denominada incremento() que pertenezca a la clase ListaEmpleados.
Esta operación aumenta el salario de cada empleado en un 10%, hacer que su
programa imprima los salarios originales y los incrementados de todos los
trabajadores. Desarrolle dos soluciones en C++, una versión no deberá usar
punteros y la otra versión deberá usar punteros a fin de agregar los datos y un
destructor para liberar memoria.
"""

"""
Se genera un nombre aleatorio de entre 3 y 10 letras, cumpliendo con las siguientes reglas:

 - Primera letra mayúscula, el resto en minúsculas.
 - No más de 2 consonantes juntas.
 - No más de 2 vocales juntas.
 - Se usan solo caracteres ASCII (A-Z y a-z).
"""

import random

class Empleado:
    def __init__(self):
        self.__codigo = None
        self.__nombre = None
        self.__salario = None

    def generar(self):
        self.__codigo = random.randint(100, 900)
        self.__nombre = self.generar_nombre()
        self.__salario = random.randint(113, 1000) * 10

    def generar_nombre(self):
        longitud = random.randint(3, 10)  # Longitud entre 3 y 10 letras
        nombre = []

        # Definir códigos ASCII para vocales y consonantes
        vocales_upper = [65, 69, 73, 79, 85]              # A, E, I, O, U
        vocales_lower = [97, 101, 105, 111, 117]           # a, e, i, o, u
        # Letras mayúsculas A-Z: 65-90, minus vocales
        consonantes_upper = [c for c in range(65, 91) if c not in vocales_upper]
        # Letras minúsculas a-z: 97-122, minus vocales
        consonantes_lower = [c for c in range(97, 123) if c not in vocales_lower]

        # Variables para contar secuencias consecutivas y para saber si se ha incluido una vocal
        cons_count = 0
        vowel_count = 0
        tiene_vocal = False

        # Primera letra: se elige de A-Z (puede ser vocal o consonante)
        first_letter = random.randint(65, 90)
        nombre.append(chr(first_letter))
        if first_letter in vocales_upper:
            tiene_vocal = True
            vowel_count = 1
            cons_count = 0
        else:
            cons_count = 1
            vowel_count = 0

        # Generar las letras restantes (todas minúsculas)
        for i in range(1, longitud):
            # Si ya hay 2 consonantes consecutivas, forzamos vocal
            if cons_count >= 2:
                letter = random.choice(vocales_lower)
                nombre.append(chr(letter))
                tiene_vocal = True
                # Reiniciamos el contador de consonantes y ponemos el de vocales en 1
                cons_count = 0
                vowel_count = 1
            # Si ya hay 2 vocales consecutivas, forzamos consonante
            elif vowel_count >= 2:
                letter = random.choice(consonantes_lower)
                nombre.append(chr(letter))
                cons_count = 1
                vowel_count = 0
            else:
                # Se puede elegir al azar entre vocal o consonante
                if random.choice([True, False]):
                    letter = random.choice(vocales_lower)
                    nombre.append(chr(letter))
                    tiene_vocal = True
                    vowel_count += 1
                    cons_count = 0
                else:
                    letter = random.choice(consonantes_lower)
                    nombre.append(chr(letter))
                    cons_count += 1
                    vowel_count = 0

        # Asegurarse de que haya al menos una vocal (si no, forzar en alguna posición que no sea la primera)
        if not tiene_vocal:
            pos = random.randint(1, longitud - 1)
            letra_forzada = random.choice(vocales_lower)
            nombre[pos] = chr(letra_forzada)

        return "".join(nombre)

    def getCodigo(self):
        return self.__codigo

    def getNombre(self):
        return self.__nombre

    def getSalario(self):
        return self.__salario

    def setSalario(self, salario):
        self.__salario = round(salario, 2)

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
        print("\n=== Aplicando Incremento del 10% ===")
        for empleado in self.__listaEmp:
            salario_anterior = empleado.getSalario()
            nuevo_salario = salario_anterior * 1.10
            empleado.setSalario(nuevo_salario)
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

    print("\n=== Lista de Empleados Original ===")
    lista.impEmpleados()

    # Aplicar incremento del 10%
    lista.incremento()

    print("\n=== Lista de Empleados con Salario Incrementado ===")
    lista.impEmpleados()


if __name__ == "__main__":
    main()
