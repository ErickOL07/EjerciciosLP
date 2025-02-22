"""
8. Implementar una clase llamada Pila, la cual tenga las operaciones de
apilar(n), desapilar() y esVacia() la cual deberá ser formada a partir de una
clase denominada ListaArreglo. La clase Lista tendrá las operaciones de
agregarElemento(n), borrarElemento(pos) y utilizará como estructura de datos
del tipo list. Solamente podrá utilizar las siguientes operaciones de listas en
Python():
pop(): elimina un elemento de una lista dada en una posición determinada
append(n): agrega un elemento a la lista
"""

class ListaArreglo:
    def __init__(self):
        # Se utiliza una lista de Python para almacenar los elementos.
        self.lista = []
    
    def agregarElemento(self, n):
        # Agrega un elemento a la lista utilizando append(n).
        self.lista.append(n)
    
    def borrarElemento(self, pos):
        # Elimina y retorna el elemento en la posición 'pos' utilizando pop(pos).
        # Se asume que 'pos' es un índice válido.
        return self.lista.pop(pos)

class Pila:
    def __init__(self):
        # La pila se forma a partir de una instancia de ListaArreglo.
        self.lista = ListaArreglo()
    
    def apilar(self, n):
        # Agrega un elemento al tope de la pila.
        # Esto se logra agregando el elemento al final de la lista.
        self.lista.agregarElemento(n)
    
    def desapilar(self):
        # Desapila el elemento en el tope de la pila.
        # Se elimina el último elemento de la lista (último agregado).
        if self.esVacia():
            raise Exception("La pila está vacía, no se puede desapilar.")
        # Se utiliza pop() con la posición del último elemento.
        return self.lista.borrarElemento(len(self.lista.lista) - 1)
    
    def esVacia(self):
        # Retorna True si la lista interna está vacía, de lo contrario False.
        return self.lista.lista == []  # Alternativamente: len(self.lista.lista) == 0

# Ejemplo de uso de la clase Pila
def main():
    pila = Pila()
    
    # Apilamos algunos elementos.
    pila.apilar(10)
    pila.apilar(20)
    pila.apilar(30)
    
    print("¿La pila está vacía?", pila.esVacia())  # Debería mostrar False.
    
    # Desapilamos los elementos y los mostramos.
    print("Elemento desapilado:", pila.desapilar())  # Debería mostrar 30.
    print("Elemento desapilado:", pila.desapilar())  # Debería mostrar 20.
    print("Elemento desapilado:", pila.desapilar())  # Debería mostrar 10.
    
    print("¿La pila está vacía?", pila.esVacia())  # Debería mostrar True.

if __name__ == "__main__":
    main()