"""
📌 Este archivo explica a detalle el módulo multiprocessing en Python.
Se detallan las funciones más importantes con ejemplos explicativos.

🔹 Contenido:
1. start() → Inicia un proceso
2. end() → Marca el final de una operación (medición de tiempo)
3. cpu_count() → Devuelve el número de núcleos del procesador
4. Pool() → Crea un grupo de procesos para ejecutar tareas en paralelo
5. chunks → Fragmentación de datos para procesamiento paralelo
6. results → Resultados devueltos por los procesos paralelos
7. end time → Mide el tiempo de ejecución de un proceso
8. Diferencia entre Process y Pool
"""

import multiprocessing as mp
import time
import random

# --------------------------------------
# 🔹 1. start() y end() (Medición de tiempo)
# --------------------------------------
"""
En programación paralela, queremos medir el tiempo de ejecución de nuestros procesos.
Usamos `time.time()` para capturar el tiempo antes (`start`) y después (`end`) de ejecutar una tarea.
"""

# Ejemplo:
start = time.time()  # Captura el tiempo inicial
time.sleep(2)        # Simula una tarea de 2 segundos
end = time.time()    # Captura el tiempo final
print("Tiempo total de ejecución:", end - start, "segundos")

# --------------------------------------
# 🔹 2. cpu_count() (Número de núcleos del procesador)
# --------------------------------------
"""
La función `mp.cpu_count()` nos dice cuántos núcleos tiene la CPU.
Esto es útil porque en `multiprocessing`, dividir el trabajo entre múltiples núcleos mejora el rendimiento.
"""

num_cores = mp.cpu_count()
print(f"Número de núcleos del CPU disponibles: {num_cores}")

# --------------------------------------
# 🔹 3. Pool() (Grupo de procesos)
# --------------------------------------
"""
El objeto `mp.Pool()` nos permite dividir una tarea en partes y ejecutarlas en paralelo en múltiples procesos.
Esto es útil cuando queremos aplicar una misma función a diferentes datos.
"""

def calcular_cuadrado(n):
    """Función que calcula el cuadrado de un número."""
    return n * n

if __name__ == "__main__":
    pool = mp.Pool(processes=4)  # Crea un pool con 4 procesos

    numeros = [1, 2, 3, 4, 5, 6, 7, 8]
    resultados = pool.map(calcular_cuadrado, numeros)  # Ejecuta la función en paralelo
    pool.close()  # Cierra el pool de procesos
    pool.join()   # Espera a que terminen todos los procesos

    print("Resultados del cálculo en paralelo:", resultados)  # [1, 4, 9, 16, 25, 36, 49, 64]

# --------------------------------------
# 🔹 4. chunks (Fragmentación de datos)
# --------------------------------------
"""
Cuando trabajamos con grandes volúmenes de datos, no podemos procesarlos de una sola vez.
Para mejorar el rendimiento, dividimos los datos en fragmentos (`chunks`) y procesamos cada fragmento en paralelo.
"""

def suma_lista(lista):
    """Función que suma los elementos de una lista."""
    return sum(lista)

if __name__ == "__main__":
    vector = [random.randint(1, 100) for _ in range(1000000)]  # Lista de 1 millón de elementos

    num_procesos = mp.cpu_count()
    tamaño_chunk = len(vector) // num_procesos  # Tamaño de cada fragmento

    chunks = [vector[i:i + tamaño_chunk] for i in range(0, len(vector), tamaño_chunk)]

    pool = mp.Pool(num_procesos)
    start = time.time()
    results = pool.map(suma_lista, chunks)  # Ejecuta en paralelo la suma de cada fragmento
    suma_total = sum(results)
    end = time.time()

    print("Tiempo total de procesamiento paralelo:", end - start, "segundos")
    print("Suma total:", suma_total)

    pool.close()
    pool.join()

# --------------------------------------
# 🔹 5. results (Recibir datos de procesos en paralelo)
# --------------------------------------
"""
Cuando usamos `Pool.map()`, obtenemos una lista de resultados con los valores calculados por cada proceso.
Podemos sumar, filtrar o combinar estos resultados según sea necesario.
"""

# En el ejemplo anterior, `results` contiene la suma parcial de cada fragmento de la lista.

# --------------------------------------
# 🔹 6. Diferencias entre `Process` y `Pool`
# --------------------------------------
"""
🔹 `mp.Process()` → Se usa para ejecutar un solo proceso manualmente.
🔹 `mp.Pool()` → Se usa para distribuir automáticamente una tarea entre múltiples procesos.

📌 ¿Cuándo usar cada uno?
✅ Usa `Process` si necesitas más control sobre cada proceso.
✅ Usa `Pool` si tienes muchas tareas similares y quieres repartir el trabajo automáticamente.
"""

def imprimir_proceso(nombre):
    """Función que ejecutará cada proceso."""
    print(f"Ejecutando proceso {nombre}")

if __name__ == "__main__":
    # Creación manual de procesos individuales
    p1 = mp.Process(target=imprimir_proceso, args=("Uno",))
    p2 = mp.Process(target=imprimir_proceso, args=("Dos",))

    p1.start()
    p2.start()

    p1.join()
    p2.join()

    print("Procesos finalizados.")

# --------------------------------------
# 🔹 7. `apply()`, `map()` y `starmap()`
# --------------------------------------
"""
📌 Métodos de `Pool` para ejecutar funciones en paralelo:

1️⃣ `apply(func, args=())` → Ejecuta una función en un solo proceso y devuelve el resultado.
2️⃣ `map(func, iterable)` → Aplica la función a cada elemento del iterable en paralelo.
3️⃣ `starmap(func, iterable_de_tuplas)` → Como `map()`, pero pasa múltiples argumentos en cada llamada.
"""

def sumar(a, b):
    return a + b

if __name__ == "__main__":
    pool = mp.Pool(4)

    # `apply()` → Ejecuta la función una vez
    resultado_apply = pool.apply(sumar, args=(5, 10))
    print("Resultado de apply:", resultado_apply)  # 15

    # `map()` → Ejecuta la función en paralelo para cada elemento
    lista_numeros = [(1, 2), (3, 4), (5, 6)]
    resultado_map = pool.starmap(sumar, lista_numeros)
    print("Resultado de starmap:", resultado_map)  # [3, 7, 11]

    pool.close()
    pool.join()

# --------------------------------------
# 🔹 8. Uso de `if __name__ == "__main__"`
# --------------------------------------
"""
⚠️ IMPORTANTE: En Windows, `multiprocessing` requiere que el código esté dentro de `if __name__ == "__main__"`.
Si no lo haces, obtendrás un error debido a la forma en que Windows maneja la creación de procesos.
"""

# --------------------------------------
# 🔹 9. Resumen General
# --------------------------------------
"""
✅ Usa `mp.cpu_count()` para saber cuántos núcleos tiene tu CPU.
✅ Usa `mp.Pool()` para distribuir automáticamente el trabajo en múltiples procesos.
✅ Usa `Pool.map()` para aplicar una función en paralelo a una lista de datos.
✅ Usa `if __name__ == "__main__"` para evitar errores en Windows.
✅ Usa `Process` si necesitas controlar cada proceso manualmente.
✅ Usa `Pool` si quieres dividir el trabajo sin preocuparte por manejar procesos manualmente.
"""

# --------------------------------------
# 🔹 10. Conclusión
# --------------------------------------
"""
El paralelismo en Python con `multiprocessing` es una forma eficiente de acelerar tareas computacionales.
Usar múltiples procesos mejora el rendimiento cuando trabajamos con cálculos intensivos en CPU.
"""

# 🚀 Ahora tienes toda la información necesaria para trabajar con multiprocessing en Python.
