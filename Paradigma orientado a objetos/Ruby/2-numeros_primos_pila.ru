"""
4. Escriba un programa que pida al usuario el ingreso de un número entero
positivo de tal manera que imprima todos los números primos hasta ese
número. Cree una clase denominada Pila (stack) la cual almacene estos
números primos y que luego imprima estos elementos en orden inverso.
Para este programa puede utilizar la estructura de datos list de Python así
como la instrucción pop(pos), esta instrucción devuelve el dato que almacena
una lista dada una posición determinada. Desarrollar su solución en Python.
Hacer su implementación en Python, C++ y Ruby.
"""

class Pila
    def initialize
      @elementos = []
    end
  
    def apilar(elemento)
      @elementos.push(elemento)
    end
  
    def desapilar
      @elementos.pop unless @elementos.empty?
    end
  
    def imprimir_inverso
      while !@elementos.empty?
        print "#{desapilar} "
      end
      puts
    end
  end
  
  def es_primo(numero)
    return false if numero < 2
    (2..Math.sqrt(numero)).each do |i|
      return false if numero % i == 0
    end
    true
  end
  
  print "Ingrese un número entero positivo: "
  n = gets.to_i
  
  if n <= 0
    puts "Por favor, ingrese un número entero positivo."
  else
    pila_primos = Pila.new
  
    (2..n).each do |num|
      pila_primos.apilar(num) if es_primo(num)
    end
  
    puts "Números primos en orden inverso:"
    pila_primos.imprimir_inverso
  end
  