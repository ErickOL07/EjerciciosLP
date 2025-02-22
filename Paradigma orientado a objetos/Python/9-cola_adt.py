"""
9. Implementar una clase llamada Cola basado en el ADT Cola, con
operaciones de encolar y decolar. Basarse en la clase lista del programa
anterior, pero primero convierta su solución del problema 8 a C++.
"""

class ListaArreglo:
    def __init__(self):
        self.lista = []
    
    def agregarElemento(self, n):
        # Agrega un elemento al final de la lista.
        self.lista.append(n)
    
    def borrarElemento(self, pos):
        # Elimina y retorna el elemento en la posición 'pos'.
        # Se asume que 'pos' es un índice válido.
        return self.lista.pop(pos)

class Cola:
    def __init__(self):
        # La Cola se implementa a partir de una instancia de ListaArreglo.
        self.lista = ListaArreglo()
    
    def encolar(self, n):
        # Encolar agrega un elemento al final de la cola.
        self.lista.agregarElemento(n)
    
    def decolar(self):
        # Decolar elimina el elemento del inicio de la cola (posición 0).
        if self.esVacia():
            raise Exception("La cola está vacía, no se puede decolar.")
        return self.lista.borrarElemento(0)
    
    def esVacia(self):
        # Retorna True si la cola no tiene elementos; de lo contrario, False.
        return len(self.lista.lista) == 0

# Ejemplo de uso de la clase Cola
if __name__ == "__main__":
    cola = Cola()
    
    # Encolar elementos
    cola.encolar(10)
    cola.encolar(20)
    cola.encolar(30)
    
    print("¿La cola está vacía?", cola.esVacia())  # Debería mostrar False
    
    # Decolar y mostrar los elementos
    print("Elemento decolado:", cola.decolar())  # Imprime 10 (el primer encolado)
    print("Elemento decolado:", cola.decolar())  # Imprime 20
    print("Elemento decolado:", cola.decolar())  # Imprime 30
    
    print("¿La cola está vacía?", cola.esVacia())  # Debería mostrar True