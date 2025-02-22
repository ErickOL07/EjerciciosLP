# Definimos una lista de ejemplo
mi_lista = [1, 2, 3, 4, 5]

print("Lista inicial:", mi_lista)

# 1. append() - Agrega un elemento al final
mi_lista.append(6)
print("Después de append(6):", mi_lista)

# 2. extend() - Extiende la lista con otra lista
mi_lista.extend([7, 8, 9])
print("Después de extend([7, 8, 9]):", mi_lista)

# 3. insert() - Inserta un elemento en una posición específica
mi_lista.insert(2, 99)  # Inserta 99 en la posición 2
print("Después de insert(2, 99):", mi_lista)

# 4. remove() - Elimina la primera aparición de un valor
mi_lista.remove(99)
print("Después de remove(99):", mi_lista)

# 5. pop() - Elimina y devuelve el último elemento o el de una posición específica
ultimo_elemento = mi_lista.pop()
print("Después de pop():", mi_lista, "Elemento eliminado:", ultimo_elemento)

elemento_pos_2 = mi_lista.pop(2)  # Elimina el elemento en la posición 2
print("Después de pop(2):", mi_lista, "Elemento eliminado en posición 2:", elemento_pos_2)

# 6. index() - Devuelve el índice de la primera aparición de un elemento
indice = mi_lista.index(4)
print("Índice de 4:", indice)

# 7. count() - Cuenta cuántas veces aparece un elemento en la lista
repeticiones = mi_lista.count(2)
print("Cantidad de veces que aparece 2:", repeticiones)

# 8. sort() - Ordena la lista en orden ascendente
mi_lista.sort()
print("Después de sort():", mi_lista)

# 9. sort(reverse=True) - Ordena la lista en orden descendente
mi_lista.sort(reverse=True)
print("Después de sort(reverse=True):", mi_lista)

# 10. reverse() - Invierte el orden de la lista
mi_lista.reverse()
print("Después de reverse():", mi_lista)

# 11. copy() - Crea una copia de la lista
copia_lista = mi_lista.copy()
print("Copia de la lista:", copia_lista)

# 12. clear() - Vacía la lista
mi_lista.clear()
print("Después de clear():", mi_lista)

# 13. len() - Obtener el tamaño de la lista
print("Longitud de la copia:", len(copia_lista))

# 14. max() - Obtener el valor máximo de la lista
print("Máximo valor en la copia:", max(copia_lista))

# 15. min() - Obtener el valor mínimo de la lista
print("Mínimo valor en la copia:", min(copia_lista))

# 16. sum() - Obtener la suma de los valores de la lista
print("Suma de los valores en la copia:", sum(copia_lista))

# 17. List comprehension - Crear una lista nueva basada en una existente
cuadrados = [x**2 for x in copia_lista]
print("Lista de cuadrados:", cuadrados)