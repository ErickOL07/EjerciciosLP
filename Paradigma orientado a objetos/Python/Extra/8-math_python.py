"""
Este programa demuestra el uso de las principales funciones de manipulación y redondeo de números en Python.
Cada función es explicada con ejemplos claros.

📌 Funciones incluidas:
- round()   → Redondeo de números
- abs()     → Valor absoluto
- pow()     → Potencias
- divmod()  → División y residuo en una sola operación
- int()     → Conversión a entero
- float()   → Conversión a flotante
- trunc()   → Eliminación de decimales sin redondeo
- ceil()    → Redondeo hacia arriba
- floor()   → Redondeo hacia abajo
"""

# 1. round(n, ndigits) - Redondea un número a `ndigits` decimales
num1 = 3.14159
print("round(3.14159, 2):", round(num1, 2))  # Redondea a 2 decimales → 3.14
print("round(3.14159, 3):", round(num1, 3))  # Redondea a 3 decimales → 3.142

# 2. abs(n) - Devuelve el valor absoluto de un número
print("abs(-10):", abs(-10))  # Devuelve 10
print("abs(3.5):", abs(3.5))  # Devuelve 3.5

# 3. pow(base, exponente, [mod]) - Calcula la potencia (opcionalmente módulo)
print("pow(2, 3):", pow(2, 3))  # 2³ = 8
print("pow(2, 3, 5):", pow(2, 3, 5))  # (2³) % 5 = 3

# 4. divmod(a, b) - Retorna la división entera y el residuo
print("divmod(10, 3):", divmod(10, 3))  # (3, 1) → 10 ÷ 3 = 3 cociente, 1 residuo

# 5. int(x) - Convierte un número a entero (truncando los decimales)
print("int(7.9):", int(7.9))  # Devuelve 7
print("int(-7.9):", int(-7.9))  # Devuelve -7

# 6. float(x) - Convierte un número o cadena en flotante
print("float(5):", float(5))  # Devuelve 5.0
print("float('3.14'):", float("3.14"))  # Convierte string en flotante


import math  # Librería de funciones matemáticas

# ----------------------------
# 🔹 1. Redondeo y valores absolutos
# ----------------------------
print("math.ceil(4.1):", math.ceil(4.1))      # Redondeo hacia arriba → 5
print("math.floor(4.9):", math.floor(4.9))    # Redondeo hacia abajo → 4
print("math.trunc(7.9):", math.trunc(7.9))    # Trunca sin redondear → 7
print("math.fabs(-10.5):", math.fabs(-10.5))  # Valor absoluto → 10.5

# ----------------------------
# 🔹 2. Potencias y raíces
# ----------------------------
print("math.pow(2, 3):", math.pow(2, 3))    # 2³ = 8.0
print("math.sqrt(25):", math.sqrt(25))      # Raíz cuadrada de 25 → 5.0
print("math.cbrt(27):", math.pow(27, 1/3))  # Raíz cúbica de 27 → 3.0
print("math.exp(1):", math.exp(1))          # Exponencial de 1 → e^1 = 2.718

# ----------------------------
# 🔹 3. Logaritmos
# ----------------------------
print("math.log(100, 10):", math.log(100, 10))  # Logaritmo base 10 de 100 → 2
print("math.log2(8):", math.log2(8))            # Logaritmo base 2 de 8 → 3
print("math.log10(1000):", math.log10(1000))    # Logaritmo base 10 de 1000 → 3

# ----------------------------
# 🔹 4. Funciones trigonométricas
# ----------------------------
angulo = math.radians(45)  # Convertir grados a radianes
print("math.sin(45°):", math.sin(angulo))      # Seno de 45°
print("math.cos(45°):", math.cos(angulo))      # Coseno de 45°
print("math.tan(45°):", math.tan(angulo))      # Tangente de 45°
print("math.asin(0.707):", math.degrees(math.asin(0.707)))  # Arco seno
print("math.acos(0.707):", math.degrees(math.acos(0.707)))  # Arco coseno
print("math.atan(1):", math.degrees(math.atan(1)))         # Arco tangente

# ----------------------------
# 🔹 5. Funciones hiperbólicas
# ----------------------------
print("math.sinh(1):", math.sinh(1))  # Seno hiperbólico
print("math.cosh(1):", math.cosh(1))  # Coseno hiperbólico
print("math.tanh(1):", math.tanh(1))  # Tangente hiperbólica

# ----------------------------
# 🔹 6. Manipulación de números especiales
# ----------------------------
print("math.isfinite(10):", math.isfinite(10))    # ¿Es un número finito? → True
print("math.isinf(math.inf):", math.isinf(math.inf))  # ¿Es infinito? → True
print("math.isnan(math.nan):", math.isnan(math.nan))  # ¿Es NaN (Not a Number)? → True

# ----------------------------
# 🔹 7. Constantes matemáticas
# ----------------------------
print("math.pi:", math.pi)          # Pi (π) → 3.1415926535
print("math.e:", math.e)            # Número de Euler (e) → 2.7182818284
print("math.tau:", math.tau)        # Tau (2π) → 6.2831853071
print("math.inf:", math.inf)        # Infinito
print("math.nan:", math.nan)        # NaN (Not a Number)
