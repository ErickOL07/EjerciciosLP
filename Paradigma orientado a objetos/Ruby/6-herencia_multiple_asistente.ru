"""
10. Siguiendo el esquema dado para Herencia Múltiple resuelva el siguiente
caso: En algunas facultades los alumnos con mejores promedios son nombrados
asistentes de curso, es decir que cumplen algunas funciones del profesor del
curso como pudiera ser el dictado de las prácticas del curso. Se nos solicita un
programa de tal manera que se puedan imprimir los cursos que lleva un
estudiante, los cursos que dicta (o lleva) un profesor, y los cursos que dicta y
lleva un asistente de curso. Puede basarse en el siguiente esquema de clases:
(figura creada con: https://www.smartdraw.com/uml-diagram/uml-diagram-tool.htm)
"""

class Curso
    attr_reader :codC, :nomC
  
    def initialize(codigo, nombre)
      @codC = codigo
      @nomC = nombre
    end
  end
  
  class Estudiante
    attr_reader :codE, :listaE
  
    def initialize(codE, listaE)
      @codE = codE
      @listaE = listaE
    end
  
    def imprimir
      puts "Estudiante #{@codE} - Cursos matriculados:"
      @listaE.each { |curso| puts "#{curso.codC}, #{curso.nomC}" }
    end
  end
  
  class Profesor
    attr_reader :codP, :listaD, :sueldo
  
    def initialize(listaD, sueldo, codP = nil)
      @codP = codP
      @listaD = listaD
      @sueldo = sueldo
    end
  
    def imprimir
      puts "Profesor #{@codP} - Cursos dictados:"
      @listaD.each { |curso| puts "#{curso.codC}, #{curso.nomC}" }
    end
  end
  
  class Asistente < Estudiante
    include Profesor # Herencia múltiple en Ruby se hace mediante módulos
  
    def initialize(codA, listaM, listaD, bono)
      super(codA, listaM)
      initialize(listaD, bono) # Inicializa Profesor
    end
  
    def imprimir
      puts "Asistente #{@codE}:"
      super() # Llama al método de Estudiante
      Profesor.instance_method(:imprimir).bind(self).call # Llama al método de Profesor
    end
  end
  
  # Programa principal
  def main
    c1 = Curso.new("C10", "Java")
    c2 = Curso.new("C20", "Cálculo")
    c3 = Curso.new("C30", "Lenguaje")
    c4 = Curso.new("C40", "Matemáticas")
  
    listaCursoM = [c1, c2]
    listaCursoD = [c3, c4]
  
    e1 = Estudiante.new("E100", listaCursoM)
    e1.imprimir
    puts "\n"
  
    p1 = Profesor.new(listaCursoD, 2000, "P100")
    p1.imprimir
    puts "\n"
  
    a1 = Asistente.new("A100", listaCursoM, listaCursoD, 1000)
    a1.imprimir
  end
  
  main
  