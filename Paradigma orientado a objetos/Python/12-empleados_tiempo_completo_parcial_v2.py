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

from abc import ABC,abstractmethod
from random import random


class Empleado(ABC):
    _metaclass__=ABC

    def __init__(self,cod=0,nomb=' '):
        self.cod=cod
        self.nomb=nomb
        self.sueldo=0
    
    def generar(self):
        minC=100    
        maxC=900
        minL=65
        maxL=90
        self.cod=(int)(100+(random()*(maxC-minC)))
        self.nomb=(chr)((int)(minL+(random()*(maxL-minL))))
        
    @abstractmethod
    def calcSueldo(self):
        pass

class TC(Empleado):
    def __init__(self,nA=0):
        super().__init__()
        self.nA=nA
        Empleado.generar(self)
        mins=1000
        maxS=9000
        self.sueldo=(1000+random()*(maxS-mins))
        
    def calcSueldo(self):
        self.sueldo=self.sueldo+self.nA*0.2*self.sueldo
        
class TP(Empleado):
    def __init__(self, hT=0, mH=0):
        super().__init__()
        Empleado.generar(self)
        minNh=10
        maxNh=160
        minCh=60
        maxCh=100
        self.hT=(int)(minNh+random()*(maxNh-minNh))
        self.mH=(int)(minCh+random()*(maxCh-minCh))

    def calcSueldo(self):
        self.sueldo=self.hT*self.mH
        
class Departamento:
    def __init__(self):
        self.listaEmp=[]
        
    def agregarEmp(self,objE):
        self.listaEmp.append(objE)
        
    def imprimir(self):
        for i in range(0,len(self.listaEmp)):
            print(self.listaEmp[i].nomb,"",self.listaEmp[i].sueldo)        

        
def main():
    objTC=TC(5)
    print(objTC.cod, "",objTC.nomb," sueldo base ",objTC.sueldo)
    objTC.calcSueldo()
    print(objTC.cod, "",objTC.nomb," sueldo bono ",objTC.sueldo)
    print("\n")
    objTP=TP()
    objTP.calcSueldo()
    print(objTP.cod," ",objTP.nomb," sueldo ",objTP.sueldo)
    print("\n")
    
    objD=Departamento()
    objD=objD.agregarEmp(objTC)
main()
