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

    def __init__(self):
        pass

    @abstractmethod
    def calculaDescuento(self, cantidad, costoArticulo):
        pass

class DescuentoBloque(PoliticaDescuento):

    def __init__(self, minimo, porcentaje):
        PoliticaDescuento.__init__(self)
        self.__minimo = minimo
        self.__porcentaje = porcentaje

    def calculaDescuento(self, cantidad, costoArticulo):
        if cantidad > self.__minimo:
            return cantidad*costoArticulo*self.__porcentaje
        return 0
        
class CompreNArticulosConsigaUnoGratis(PoliticaDescuento):

    def __init__(self, n):
        PoliticaDescuento.__init__(self)
        self.__n = n

    def calculaDescuento(self, cantidad, costoArticulo):
        c = 0; descuento = 0
        while c < cantidad:
            c += 1
            if c%self.__n == 0:
                descuento += costoArticulo
        return descuento
    
class DescuentoCombinado(PoliticaDescuento):

    def __init__(self, objPolitica1, objPolitica2):
        PoliticaDescuento.__init__(self)
        self.__objPolitica1 = objPolitica1
        self.__objPolitica2 = objPolitica2
    
    def calculaDescuento(self, cantidad, costoArticulo):
        return self.__objPolitica1.calculaDescuento(cantidad, costoArticulo) + self.__objPolitica2.calculaDescuento(cantidad, costoArticulo)
    
# Main hecho con gepeto xq me dio flojera

def main():
    cantidad = 10  # Cantidad de artículos comprados
    costo_articulo = 50  # Costo por artículo

    # Crear objetos de diferentes políticas de descuento
    descuento1 = DescuentoBloque(minimo=5, porcentaje=0.1)  # 10% de descuento si compra más de 5
    descuento2 = CompreNArticulosConsigaUnoGratis(n=3)  # Por cada 3 artículos, 1 gratis
    descuento_combinado = DescuentoCombinado(descuento1, descuento2)

    # Arreglo de objetos de tipo PoliticaDescuento
    politicas_descuento = [
        ("Descuento por bloque", descuento1),
        ("Descuento por N artículos gratis", descuento2),
        ("Descuento combinado", descuento_combinado)
    ]

    # Precio total sin descuento
    precio_total_original = cantidad * costo_articulo

    print("=" * 50)
    print(f"{'Resumen de Compra':^50}")
    print("=" * 50)
    print(f"Cantidad de artículos: {cantidad}")
    print(f"Precio por unidad: S/. {costo_articulo:.2f}")
    print(f"Precio total sin descuentos: S/. {precio_total_original:.2f}")
    print("-" * 50)

    # Recorrer el arreglo de políticas de descuento e imprimir los descuentos respectivos
    for nombre, politica in politicas_descuento:
        descuento = politica.calculaDescuento(cantidad, costo_articulo)
        precio_final = precio_total_original - descuento

        print(f"{nombre}:")
        print(f"  ➜ Descuento aplicado: S/. {descuento:.2f}")
        print(f"  ➜ Precio final después del descuento: S/. {precio_final:.2f}")
        print("-" * 50)

if __name__ == "__main__":
    main()
