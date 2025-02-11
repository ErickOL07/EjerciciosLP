; 36. Defina una función que permita crear un BST.

#lang racket

; Definir la función "insertar-en-bst" para insertar un número en un BST.
(define insertar-en-bst
  (lambda (bst n)
    ; Evaluar si el BST está vacío.
    (if (null? bst)
        ; Retornar un nuevo nodo con "n" como valor y dos subárboles vacíos.
        (list n '() '())
        ; Comparar "n" con el valor del nodo actual obtenido con "car".
        (if (< n (car bst))
            ; Insertar recursivamente "n" en el subárbol izquierdo (obtener con "cadr").
            ; Retornar un nuevo nodo con el valor actual, el subárbol izquierdo actualizado y el subárbol derecho sin cambios.
            (list (car bst) (insertar-en-bst (cadr bst) n) (caddr bst))
            ; Insertar recursivamente "n" en el subárbol derecho (obtener con "caddr").
            ; Retornar un nuevo nodo con el valor actual, el subárbol izquierdo sin cambios y el subárbol derecho actualizado.
            (list (car bst) (cadr bst) (insertar-en-bst (caddr bst) n))))))

; Definir la función "crear-bst" para construir un BST a partir de una lista de números.
(define crear-bst
  (lambda (lista)
    ; Inicializar el BST como vacío.
    ; Recorrer cada elemento de "lista" e insertar el elemento en el BST acumulado.
    (foldl insertar-en-bst '() lista)))

; Ejemplo: Construir un BST a partir de la lista de números.
(define lista-numeros '(5 3 8 1 4 6 9))
(define bst-resultante (crear-bst lista-numeros))

; Mostrar en la consola el BST resultante.
(displayln bst-resultante)
