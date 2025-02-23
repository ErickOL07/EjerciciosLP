"""
11. En algunas ocasiones se menciona que la herencia múltiple puede ser la
consecuencia de un mal diseño, debido a esto se le solicita cambiar su programa
de la pregunta anterior a fin que tan sólo se utilice herencia simple.
Nota: Puede utilizar herencia con una clase y asociación con la otra.
Diseñe su solución en Ruby.
"""

require 'securerandom'

# Definir lista de cursos
CURSOS = ["Matemática", "Física", "Química", "Historia", "Programación", "Redes", "Álgebra", "Estadística"]

class Curso
  attr_reader :codigo, :nombre

  def initialize(nombre)
    @codigo = SecureRandom.hex(3) # Genera un código aleatorio
    @nombre = nombre
  end
end

class Estudiante
  attr_reader :codigo, :cursos_matriculados

  def initialize(codigo, cursos)
    @codigo = codigo
    @cursos_matriculados = cursos
  end

  def imprimir
    puts "Estudiante #{@codigo} - Cursos matriculados:"
    @cursos_matriculados.each { |curso| puts "#{curso.codigo}, #{curso.nombre}" }
  end
end

class Profesor
  attr_reader :codigo, :cursos_dictados, :sueldo

  def initialize(codigo, cursos, sueldo)
    @codigo = codigo
    @cursos_dictados = cursos
    @sueldo = sueldo
  end

  def imprimir
    puts "Profesor #{@codigo} - Cursos dictados:"
    @cursos_dictados.each { |curso| puts "#{curso.codigo}, #{curso.nombre}" }
  end
end

class Asistente < Estudiante
  def initialize(codigo, cursos_matriculados, profesor)
    super(codigo, cursos_matriculados)
    @profesor = profesor # Asociación con un Profesor
  end

  def imprimir
    puts "Asistente #{@codigo}:"
    super() # Imprime cursos matriculados
    puts "Cursos dictados como asistente:"
    @profesor.cursos_dictados.each { |curso| puts "#{curso.codigo}, #{curso.nombre}" }
  end
end

# Generación aleatoria de cursos
def generar_cursos(n)
  CURSOS.sample(n).map { |nombre| Curso.new(nombre) }
end

# Programa principal
def main
  estudiantes = []
  profesores = []
  asistentes = []

  # Generar Estudiantes
  3.times do
    estudiantes << Estudiante.new("E#{rand(100..999)}", generar_cursos(rand(3..5)))
  end

  # Generar Profesores
  3.times do
    profesores << Profesor.new("P#{rand(100..999)}", generar_cursos(rand(2..4)), rand(2000..5000))
  end

  # Generar Asistentes (con asociación a un profesor)
  2.times do
    asistentes << Asistente.new("A#{rand(100..999)}", generar_cursos(rand(2..4)), profesores.sample)
  end

  # Imprimir información
  puts "\n=== ESTUDIANTES ==="
  estudiantes.each(&:imprimir)

  puts "\n=== PROFESORES ==="
  profesores.each(&:imprimir)

  puts "\n=== ASISTENTES ==="
  asistentes.each(&:imprimir)
end

main
