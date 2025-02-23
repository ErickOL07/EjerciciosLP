"""
12. Los empleados de una compañía X son divididos en dos categorías:
empleados a tiempo parcial y empleados a tiempo completo. 

Los empleados a tiempo parcial su sueldo se calcula según el número de
horas trabajadas al mes por el costo por hora que determine la empresa.

Los empleados a tiempo completo reciben un monto mensual fijo el cual
es afecto a un bono igual al 20% de su sueldo por cada año trabajado.

Realice un programa usando clases abstractas que permita calcular el sueldo
de un par de empleados a tiempo parcial y a tiempo completo.

Se sugiere que los datos de los empleados sean generados de forma aleatoria.
Diseñe su solución en Python, C++ y Ruby.
"""

require 'securerandom'

# Clase Abstracta Empleado
class Empleado
  attr_reader :cod, :nomb, :sueldo

  def initialize
    @cod = rand(100..900) # Código entre 100 y 900
    @nomb = ('A'..'Z').to_a.sample # Letra aleatoria
    @sueldo = 0.0
  end

  def calc_sueldo
    raise NotImplementedError, "Este método debe ser implementado por una subclase"
  end

  def imprimir
    puts "Empleado #{@cod} - Nombre: #{@nomb} - Sueldo: S/#{@sueldo.round(2)}"
  end
end

# Clase Empleado a Tiempo Completo (TC)
class TC < Empleado
  def initialize(nA = 0)
    super()
    @nA = nA
    @sueldo = rand(1000..9000) # Sueldo base entre 1000 y 9000
  end

  def calc_sueldo
    @sueldo += (@nA * 0.2 * @sueldo) # Bono del 20% por cada año trabajado
  end

  def imprimir
    puts "Empleado TC #{@cod} - Nombre: #{@nomb} - Sueldo con bono: S/#{@sueldo.round(2)}"
  end
end

# Clase Empleado a Tiempo Parcial (TP)
class TP < Empleado
  def initialize
    super()
    @hT = rand(10..160) # Horas trabajadas entre 10 y 160
    @mH = rand(60..100) # Pago por hora entre 60 y 100
  end

  def calc_sueldo
    @sueldo = @hT * @mH
  end

  def imprimir
    puts "Empleado TP #{@cod} - Nombre: #{@nomb} - Sueldo: S/#{@sueldo.round(2)}"
  end
end

# Clase Departamento
class Departamento
  def initialize
    @lista_emp = []
  end

  def agregar_emp(empleado)
    @lista_emp << empleado
  end

  def imprimir
    @lista_emp.each(&:imprimir)
  end
end

# Función principal
def main
  objTC = TC.new(5)
  objTC.calc_sueldo

  objTP = TP.new
  objTP.calc_sueldo

  # Creación del departamento y adición de empleados
  objD = Departamento.new
  objD.agregar_emp(objTC)
  objD.agregar_emp(objTP)

  # Imprimir resultados
  puts "\n=== EMPLEADOS ==="
  objD.imprimir
end

main
