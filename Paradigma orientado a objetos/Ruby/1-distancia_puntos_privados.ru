"""
2. Modifique su programa anterior de tal forma que las atributos de la clase se
encuentren de forma privada. Desarrolle su solución en Python, C++, Ruby y
Smalltalk. Compare sus soluciones.
Nota: Recuerde que no es un curso de Python, C++ o Ruby, la sintaxis la
puede conseguir de cualquier libro. Se podrá cambiar de lenguaje en cualquier
momento del curso.
En el caso de Ruby y Python puede usar el siguiente compilador en línea:
https://www.onlinegdb.com/online_ruby_compiler
Para el caso de C++ puede ser CodeBlocks o algún compilador en línea.
En el caso de SmallTalk el siguiente compilador puede servir:
https://www.tutorialspoint.com/execute_smalltalk_online.php
"""

class Punto
    def initialize(x, y)
      @x = x
      @y = y
    end
  
    def distancia(otro_punto)
      Math.sqrt((otro_punto.x - @x)**2 + (otro_punto.y - @y)**2)
    end
  
    def imprimir
      "(#{@x}, #{@y})"
    end
  
    private
  
    attr_reader :x, :y
  end
  
  # Programa principal
  p1 = Punto.new(3, 5)
  p2 = Punto.new(8, 4)
  
  puts "La distancia entre P1 #{p1.imprimir} y P2 #{p2.imprimir} es #{p1.distancia(p2)}."
  