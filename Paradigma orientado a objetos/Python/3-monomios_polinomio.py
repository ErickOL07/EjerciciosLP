"""
3. Un monomio es una expresión algebraica que tiene la siguiente forma:
cx^n
Defina una clase polinomio la cual contenga un método que permita agregar los
monomios a una lista y que luego imprima el polinomio respectivo. Su
programa deberá ser llamado, desde un programa principal, de la siguiente
forma:
obj1=Monomio(3,"x",4)
obj2=Monomio(-2,"x",5)
obj3=Monomio(5,"x",-4)
p=Polinomio()
p.agregar(obj1)
p.agregar(obj2)
p.agregar(obj3)
p.imprimirP() 
El polinomio podrá ser impreso de la siguiente forma: 3x**4+ -2x**5+ 5x**-4+
Puede usar al final de un print la instrucción end=” “ a fin de que no imprima
cada dato en una línea distinta
"""

class Monomio:

    def __init__(self, c1, x, c2):
        self.__c1 = c1
        self.__x = x
        self.__c2 = c2

    def getC1(self):
        return self.__c1
    
    def getX(self):
        return self.__x
    
    def getC2(self):
        return self.__c2
    
class Polinomio:
    def __init__(self):
        self.monomios = []
    
    def agregar(self, monomio):
        self.monomios.append(monomio)

    def imprimirP(self):
        s = ""
        for monomio in self.monomios:
            s += f'{monomio.getC1()}{monomio.getX()}**{monomio.getC2()}+ '
        print(s)

def main():
    obj1=Monomio(3,"x",4)
    obj2=Monomio(-2,"x",5)
    obj3=Monomio(5,"x",-4)
    p=Polinomio()
    p.agregar(obj1)
    p.agregar(obj2)
    p.agregar(obj3)
    p.imprimirP() 

if __name__ == "__main__":
    main()