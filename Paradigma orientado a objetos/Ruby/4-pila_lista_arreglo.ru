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

class ListaArreglo
    def initialize
      @lista = []
    end
  
    def agregarElemento(n)
      @lista.push(n) # Similar a append(n) en Python
    end
  
    def borrarElemento(pos)
      raise "Índice fuera de rango" if pos < 0 || pos >= @lista.size
      @lista.delete_at(pos) # Similar a pop(pos) en Python
    end
  
    def vacia?
      @lista.empty?
    end
  
    def tamano
      @lista.size
    end
  
    def obtenerLista
      @lista
    end
  end
  
  class Pila
    def initialize
      @lista = ListaArreglo.new
    end
  
    def apilar(n)
      @lista.agregarElemento(n)
    end
  
    def desapilar
      raise "La pila está vacía, no se puede desapilar." if esVacia?
      @lista.borrarElemento(@lista.tamano - 1)
    end
  
    def esVacia?
      @lista.vacia?
    end
  end
  
  # Ejemplo de uso de la clase Pila
  def main
    pila = Pila.new
  
    # Apilamos algunos elementos
    pila.apilar(10)
    pila.apilar(20)
    pila.apilar(30)
  
    puts "¿La pila está vacía? #{pila.esVacia?}" # Debería mostrar false
  
    # Desapilamos elementos y los mostramos
    puts "Elemento desapilado: #{pila.desapilar}" # Debería mostrar 30
    puts "Elemento desapilado: #{pila.desapilar}" # Debería mostrar 20
    puts "Elemento desapilado: #{pila.desapilar}" # Debería mostrar 10
  
    puts "¿La pila está vacía? #{pila.esVacia?}" # Debería mostrar true
  end
  
  main
  