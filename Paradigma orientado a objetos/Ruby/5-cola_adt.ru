"""
9. Implementar una clase llamada Cola basado en el ADT Cola, con
operaciones de encolar y decolar. Basarse en la clase lista del programa
anterior, pero primero convierta su solución del problema 8 a C++.
"""

class Cola
    def initialize
      @lista = ListaArreglo.new
    end
  
    def encolar(n)
      @lista.agregarElemento(n)
    end
  
    def decolar
      raise "La cola está vacía, no se puede decolar." if esVacia?
      @lista.borrarElemento(0) # Elimina el primer elemento
    end
  
    def esVacia?
      @lista.vacia?
    end
  end
  
  # Ejemplo de uso de la clase Cola
  def main
    cola = Cola.new
  
    # Encolar elementos
    cola.encolar(10)
    cola.encolar(20)
    cola.encolar(30)
  
    puts "¿La cola está vacía? #{cola.esVacia?}" # Debería mostrar false
  
    # Decolar y mostrar los elementos
    puts "Elemento decolado: #{cola.decolar}" # Imprime 10 (el primer encolado)
    puts "Elemento decolado: #{cola.decolar}" # Imprime 20
    puts "Elemento decolado: #{cola.decolar}" # Imprime 30
  
    puts "¿La cola está vacía? #{cola.esVacia?}" # Debería mostrar true
  end
  
  main
  