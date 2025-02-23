# Importamos el módulo 'time' para medir el tiempo de ejecución de las funciones.
import time

# Importamos el módulo 'random' para generar números aleatorios.
import random

# Importamos el módulo 'multiprocessing' y le asignamos el alias 'mp' para manejar procesos en paralelo.
import multiprocessing as mp

# Definimos una función llamada 'sumaSec' que realiza la suma de un vector de manera secuencial.
def sumaSec(v):
    s = 0  # Inicializamos la variable acumuladora 's' en 0.

    # Capturamos el tiempo inicial antes de iniciar la suma.
    start = time.time()

    # Recorremos la lista 'v' y sumamos cada elemento al acumulador 's'.
    for i in range(0, len(v)):
        s = s + v[i]

    # Capturamos el tiempo final después de realizar la suma.
    end = time.time()

    # Imprimimos el tiempo total que tomó la operación y el resultado de la suma.
    print("Tiempo secuencial:", end - start, "segundos. Suma es:", s)

# Definimos una función llamada 'sumaV' que suma los elementos de una lista y retorna el resultado.
def sumaV(v):
    s = 0  # Inicializamos la variable acumuladora 's' en 0.

    # Recorremos la lista 'v' y sumamos cada elemento al acumulador 's'.
    for i in range(0, len(v)):
        s = s + v[i]

    return s  # Retornamos el resultado de la suma.

# Definimos la función principal del programa.
def main():
    # Creamos una lista llamada 'vector' con 1,000,000 de números enteros aleatorios entre 1 y 100.
    vector = [random.randint(1, 101) for i in range(1000000)]

    # Llamamos a la función 'sumaSec' para calcular la suma de 'vector' de forma secuencial.
    sumaSec(vector)

    # Obtenemos el número total de núcleos del CPU disponibles en el sistema.
    w = mp.cpu_count()

    # Creamos un 'pool' de procesos con 'w' núcleos para realizar la computación en paralelo.
    pool = mp.Pool(w)

    # Calculamos el tamaño de los fragmentos de la lista 'vector' que serán procesados por cada núcleo.
    c = (int)(len(vector) / (w * 10))

    # Generamos fragmentos de la lista 'vector' de tamaño 'c'.
    chunks = (vector[i:i + c] for i in range(0, len(vector), c))

    # Capturamos el tiempo inicial antes de la suma en paralelo.
    start = time.time()

    # Ejecutamos la función 'sumaV' en paralelo sobre cada fragmento de la lista 'vector'.
    results = pool.map(sumaV, [chunk for chunk in chunks])

    # Sumamos los resultados parciales obtenidos de cada proceso.
    s = sum(results)

    # Capturamos el tiempo final después de realizar la suma en paralelo.
    end = time.time()

    # Imprimimos el tiempo total que tomó la operación en paralelo y el resultado de la suma.
    print("Tiempo paralelo:", end - start, "segundos. Suma es:", s)

    # Cerramos el 'pool' de procesos para liberar recursos.
    pool.close()

# Verificamos si el script se está ejecutando directamente y no importado como módulo.
if __name__ == "__main__":
    main()
