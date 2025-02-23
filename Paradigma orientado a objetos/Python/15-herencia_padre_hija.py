"""
15. Programe en C++ una clase Padre y una clase Hija las cuales están
relacionadas por Herencia. Realizar los siguientes pasos:

a) La clase Padre tendrá un atributo a, con un constructor que permita
inicializar dicha variable.

b) La clase Hija deberá tener dos atributos c,d los cuales son inicializados
mediante su constructor. Aparte, uno de los valores que reciba el constructor
deberá ser enviado al constructor de la clase padre.

c) La clase Padre deberá tener una función que imprime el valor de su atributo
a.

d) La clase Hija deberá también tener una función imprimir que imprima el
valor de sus atributos c, d.

e) Cree una función llamada funcA la cual reciba un objeto de la clase padre y
que llame a la función imprimir.

f) En su función principal cree un objeto de la clase padre, un objeto d ela clase
hija y envíe a la función funcA primero el objeto Padre y luego, mediante otra
llamada a esta función, el objeto de la clase Hija. Observe que sucede con las
variables impresas.

En caso de existir object slicing modificar su función funcA de tal manera que
reciba un puntero a un objeto de la clase padre. Observe sus resultados.
"""

class Padre:
    def __init__(self, a):
        self._a = a  # Cambio de __a a _a para evitar problemas de acceso

    def imprimir(self):
        print(f'Valor de "a": {self._a}')

class Hija(Padre):
    def __init__(self, a, c, d):
        super().__init__(a)
        self._c = c
        self._d = d

    def imprimir(self):
        print(f'Valor de "a" (heredado): {self._a}')
        print(f'Valor de "c": {self._c}')
        print(f'Valor de "d": {self._d}')

def funcA(objPadre):
    objPadre.imprimir()

def main():
    padre = Padre('ValorA_Padre')
    hija = Hija('ValorA_Hija', 'ValorC_Hija', 'ValorD_Hija')

    print("Función imprimir:")
    print(" - Padre:")
    padre.imprimir()
    print(" - Hija:")
    hija.imprimir()

    print("\nFunción funcA:")
    print(" - Enviando objeto Padre a funcA:")
    funcA(padre)
    
    print(" - Enviando objeto Hija a funcA:")
    funcA(hija)  # Se usa polimorfismo, debe imprimir los valores de Hija

if __name__ == "__main__":
    main()
