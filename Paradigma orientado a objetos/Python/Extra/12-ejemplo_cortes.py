# Definimos una función llamada 'test' que encapsula toda la lógica del código.
def test():
    longitud = 1000  # Declaramos una variable llamada 'longitud' con un valor de 1000.
    w = 5  # Declaramos una variable llamada 'w' con un valor de 5.

    # Calculamos la variable 'c' dividiendo 'longitud' entre 'w * 10'.
    # Convertimos el resultado a un entero (int) para asegurarnos de que es un número entero.
    c = (int)(longitud / (w * 10))

    # Este print está comentado, pero mostraría el número de cortes calculados.
    # print("cortes ", c)

    # Creamos un bucle 'for' que itera desde 0 hasta 'longitud', incrementando en pasos de 'c'.
    for i in range(0, longitud, c):
        # Este print está comentado, pero mostraría el valor de 'i' en cada iteración.
        # print(i)
        pass  # La palabra clave 'pass' indica que el bucle no tiene ninguna acción.

    # Creamos una lista llamada 'vector' con valores de 0 a 999 usando una **list comprehension**.
    vector = [i for i in range(1000)]

    # Este print está comentado, pero imprimiría el contenido de la lista 'vector'.
    # print(vector)

    # Calculamos 'd' dividiendo la longitud de 'vector' entre 'w * 10' y convirtiéndolo a entero.
    d = (int)(len(vector) / (w * 10))

    # Imprimimos la cantidad de cortes calculados.
    print("cortes ", d)

    # Creamos un generador 'chunks' que genera porciones de la lista 'vector'.
    # Cada porción tiene un tamaño de 'd' elementos y se extrae de 'vector' en pasos de 'd'.
    chunks = (vector[i:i + d] for i in range(0, len(vector), d))

    # Iteramos sobre 'chunks' y imprimimos cada subconjunto de elementos generado.
    for item in chunks:
        print(item)

# La siguiente línea verifica si el script se está ejecutando directamente.
# Si es así, llama a la función 'test'.
if __name__ == "__main__":
    test()