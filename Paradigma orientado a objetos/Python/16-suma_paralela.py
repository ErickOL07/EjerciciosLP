"""
16. Inicialice una lista o arreglo unidimensional con números al azar
comprendidos entre 1 y un millón. Su programa deberá sumar los elementos de
este arreglo haciendo uso de una función que los sume secuencialmente, y otra
función que sume estos elementos usando paralelismo. Para la parte de
paralelismo se sugiere que prueba su programa usando threads y luego los
procesadores disponibles en su computador, comparando los resultados de la
versión secuencial con las versiones paralelas.
"""

import random
import multiprocessing as mp
import time

def suma(lista):
    suma = 0
    for i in range(len(lista)):
        suma += lista[i]
    return suma

def main():

    l = []

    for _ in range(10000000):
        l.append(random.randint(1, 1000000))

    print(f'10 primeros elementos de la lista:\n{l[:10]}\n')
    inicio = time.time() 
    print(f'Suma secuencial: {suma(l)}')
    fin = time.time() 
    print(f'Tiempo de ejecución: {fin - inicio} segundos.\n')

    num_cores = mp.cpu_count()
    print(f"Número de núcleos del CPU disponibles: {num_cores}")

    tamaño_chunk = len(l) // num_cores
    chunks = [l[i:i + tamaño_chunk] for i in range(0, len(l), tamaño_chunk)]

    pool = mp.Pool(processes=num_cores)

    inicio = time.time() 
    print(f'Suma paralela: {sum(pool.map(suma, chunks))}')
    pool.close()
    pool.join()
    fin = time.time() 
    print(f'Tiempo de ejecución: {fin - inicio} segundos.\n')



if __name__ == "__main__":
    main()