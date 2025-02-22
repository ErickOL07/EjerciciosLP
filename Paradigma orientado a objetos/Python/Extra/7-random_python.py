from random import random, randint, uniform, choice, sample, shuffle, gauss, triangular

# 1. random() - Genera un número flotante entre 0 y 1
print("Número aleatorio entre 0 y 1:", random())

# 2. randint(a, b) - Genera un número entero aleatorio en el rango [a, b]
print("Número entero aleatorio entre 1 y 100:", randint(1, 100))

# 3. uniform(a, b) - Genera un número flotante aleatorio entre `a` y `b`
print("Número flotante aleatorio entre 1.5 y 10.5:", uniform(1.5, 10.5))

# 4. choice(seq) - Elige un elemento aleatorio de una secuencia
colores = ["rojo", "verde", "azul", "amarillo"]
print("Color aleatorio:", choice(colores))

# 5. sample(seq, k) - Devuelve `k` elementos aleatorios de una secuencia sin repetir
print("Muestra de 2 colores:", sample(colores, 2))

# 6. shuffle(seq) - Mezcla aleatoriamente los elementos de una lista
numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9]
shuffle(numeros)
print("Lista de números mezclada:", numeros)

# 7. gauss(mu, sigma) - Genera un número con distribución gaussiana
media = 0
desviacion = 1
print("Número aleatorio con distribución normal (media=0, sigma=1):", gauss(media, desviacion))

# 8. triangular(low, high, mode) - Devuelve un número flotante dentro de un rango basado en una distribución triangular
print("Número con distribución triangular entre 1 y 10 con modo en 5:", triangular(1, 10, 5))

"""
Conversión de números a letras con ASCII
----------------------------------------
Los caracteres en Python pueden representarse mediante números en el estándar ASCII.
- `chr(n)`: Convierte un número en un carácter (por ejemplo, `chr(65) → 'A'`).
- `ord(c)`: Convierte un carácter en su número ASCII (`ord('A') → 65`).

En este programa, generamos letras aleatorias usando valores ASCII.
"""

# 9. Generar una letra mayúscula aleatoria (A-Z)
letra_mayuscula = chr(randint(65, 90))  # ASCII: A-Z (65-90)
print("Letra mayúscula aleatoria:", letra_mayuscula)

# 10. Generar una letra minúscula aleatoria (a-z)
letra_minuscula = chr(randint(97, 122))  # ASCII: a-z (97-122)
print("Letra minúscula aleatoria:", letra_minuscula)

# 11. Generar un número aleatorio del 0 al 9 y convertirlo a carácter
numero_a_caracter = chr(randint(48, 57))  # ASCII: 0-9 (48-57)
print("Número aleatorio como carácter:", numero_a_caracter)

# 12. Generar una cadena aleatoria de 5 letras (mayúsculas y minúsculas)
cadena_aleatoria = ''.join(chr(randint(65, 90)) for _ in range(5))  # 5 letras mayúsculas
print("Cadena aleatoria de 5 letras mayúsculas:", cadena_aleatoria)

cadena_aleatoria_mixta = ''.join(chr(randint(97, 122) if randint(0,1) else randint(65,90)) for _ in range(5))
print("Cadena aleatoria de 5 letras (mayúsculas y minúsculas):", cadena_aleatoria_mixta)

"""
¿Qué es una distribución gaussiana?
-----------------------------------
La distribución gaussiana (también conocida como distribución normal o curva de campana) 
es un tipo de distribución de probabilidad continua que describe muchos fenómenos naturales. 

Se caracteriza por dos parámetros:
1. **Media (μ)**: Es el valor central de la distribución.
2. **Desviación estándar (σ)**: Determina la dispersión de los valores alrededor de la media.

Fórmula matemática de la distribución normal:
f(x) = (1 / (σ * sqrt(2π))) * e^(-(x - μ)² / (2σ²))

Donde:
- `e` es el número de Euler (~2.718),
- `π` es pi (~3.1416),
- `x` es el valor aleatorio generado.

Ejemplo de uso:
- En estadística, la distribución normal se usa para modelar la altura de las personas, 
  calificaciones en exámenes, errores en mediciones, etc.
"""