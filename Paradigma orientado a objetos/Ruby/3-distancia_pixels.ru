"""
7. Un pixel es igual a un punto con coordenadas (x,y) con la única diferencia
que un pixel contiene también un color, por ejemplo (x,y,”rojo”). Desarrollar un
programa que permita hallar la distancia entre dos pixels usando el programa
del punto desarrollado anteriormente. Implementar su solución en C++ y
Ruby.
"""

class Pixel
    COLORES_RGB = {
      "rojo" => [255, 0, 0],
      "verde" => [0, 255, 0],
      "azul" => [0, 0, 255],
      "amarillo" => [255, 255, 0],
      "cian" => [0, 255, 255],
      "magenta" => [255, 0, 255],
      "negro" => [0, 0, 0],
      "blanco" => [255, 255, 255],
      "gris" => [128, 128, 128],
      "naranja" => [255, 165, 0],
      "morado" => [128, 0, 128],
      "rosado" => [255, 192, 203],
      "marrón" => [165, 42, 42]
    }
  
    attr_reader :x, :y, :color
  
    def initialize(x, y, color)
      @x = x
      @y = y
      @color = COLORES_RGB[color] || [0, 0, 0] # Si el color no existe, se asigna negro
    end
  
    def distancia(pixel_b)
      distancia_espacial = Math.sqrt((pixel_b.x - @x)**2 + (pixel_b.y - @y)**2).round(5)
      diferencia_color = [
        (pixel_b.color[0] - @color[0]).abs,
        (pixel_b.color[1] - @color[1]).abs,
        (pixel_b.color[2] - @color[2]).abs
      ]
      "#{distancia_espacial} (#{diferencia_color.join(', ')})"
    end
  end
  
  # Programa Principal
  def main
    p1 = Pixel.new(3, 5, "rojo")
    p2 = Pixel.new(8, 4, "verde")
  
    puts "La distancia entre P1 (#{p1.x}, #{p1.y}, #{p1.color}) y P2 (#{p2.x}, #{p2.y}, #{p2.color}) es #{p1.distancia(p2)}."
  end
  
  main
  