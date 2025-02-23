"""
14. Siga los pasos que a continuación se describen:
a) Cree una clase abstracta llamada PoliticaDescuento. Esta clase deberá
tener un solo método abstracto llamado calculaDescuento, el cual retornará el
descuento por la compra de un número determinado de un artículo en
particular. El método tiene dos parámetros, cantidad y costoArticulo.

b) Derive una clase llamada DescuentoBloque de PoliticaDescuento. Esta
clase deberá tener un constructor con dos parámetros: mínimo y porcentaje. El
método calculaDescuento funcionará del siguiente modo, si la cantidad
adquirida de un artículo es mayor a un mínimo, el descuento será de un
porcentaje dado por la variable respectiva.

c) Derive una clase llamada CompreNArticulosConsigaUnoGratis de
Politica Descuento. Esta clase deberá de tener un constructor que tiene un solo
parámetro n. Esta clase implementará el método calculaDescuento de tal modo
que cada n artículo es gratis. Por ejemplo, la siguiente tabla da los descuentos
para la compra de varias cantidades de un artículo que cuesta $10, cuando n es
3:
Cantidad    1   2   3   4   5   6   7
Descuento   0   0   10  10  10  20  20

d) Derive una clase llamada DescuentoCombinado de PoliticaDescuento.
Su constructor tendrá dos parámetros de tipo PoliticaDescuento. Ésta deberá
implementar el método calculaDescuento para cada una de sus políticas de
descuento. Las políticas de descuento se encuentran en los ejercicios 5 y 6.
Adicionalmente cree un arreglo de objetos del tipo PoliticaDescuento e imprima
los descuentos respectivos de cada objeto.
Para el ejercicio planteado puede utilizar Herencia, Clases Abstractas o
Asociación según lo considere conveniente.
Desarrolle su solución en Python y C++.
"""

from abc import ABC, abstractmethod

class PoliticaDescuento(ABC):
    __metaclass__=ABC
    
    def __init__(self, cant=0, cost=0, desc=0, total=0):
        self.cant = cant
        self.cost = cost
        self.desc = desc
        self.total = self.cant * self.cost

    @abstractmethod
    def calcDesc(self):
        pass

class DescBloque(PoliticaDescuento):
    def __init__(self, cant, cost, mini, porc):
        PoliticaDescuento.__init__(self, cant, cost)
        self.mini = mini
        self.porc = porc
        self.desc = self.calcDesc()

    def calcDesc(self):
        if self.cant > self.mini:
            self.desc = self.total * self.porc
        else:
            self.desc = 0
        return self.total - self.desc   
        
class CompreN(PoliticaDescuento):
    def __init__(self, cant, cost, n):
        PoliticaDescuento.__init__(self,cant,cost)
        self.n = n
        self.desc = self.calcDesc()

    def calcDesc(self):
        artDesc = self.cant // self.n
        self.desc = artDesc * self.cost
        return self.total - self.desc

class DescComb(PoliticaDescuento):
    def __init__(self, objDB, objCN):
        self.objDB = objDB
        self.objCN = objCN

    def calcDesc(self):
        self.desc = self.objDB.calcDesc() + self.objCN.calcDesc()
        return self.objDB.total-(self.objDB.desc+self.objCN.desc)

def main():
    objDB1 = DescBloque(5, 10, 3, 0.15)
    print("Desc. Bloque:", objDB1.calcDesc())
    objCN1 = CompreN(5, 10, 3)
    print("Compra N:", objCN1.calcDesc())
    objComb = DescComb(objDB1, objCN1)
    print("Combinado:", objComb.calcDesc())

main()