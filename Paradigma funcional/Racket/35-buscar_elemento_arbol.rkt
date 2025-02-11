; 35. Defina un árbol de números usando listas y luego realice una función que
; devuelva verdadero si un elemento se encuentra en este árbol. En Racket un
; árbol puede definirse del siguiente modo:
; (define tree '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ()))))
; En este árbol pruebe las siguientes instrucciones antes de hacer su programa:
; (car tree)
; (cadr tree)
; (caddr tree)
; Nota: Para el presente problema puede asumir que el árbol es un Binary
; Search Tree.
; (define tree '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ()))))

#lang racket

; Definir el árbol "tree" como una lista que representa un Binary Search Tree.
(define tree '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ()))))

; Ejecutar "car" sobre "tree" para obtener la raíz del árbol.
(displayln (car tree))  ; Mostrar 5, que es el valor de la raíz.

; Ejecutar "cadr" sobre "tree" para obtener el subárbol izquierdo.
(displayln (cadr tree)) ; Mostrar (3 (1 () ()) (4 () ())), el subárbol izquierdo.

; Ejecutar "caddr" sobre "tree" para obtener el subárbol derecho.
(displayln (caddr tree)) ; Mostrar (8 (6 () ()) (9 () ())), el subárbol derecho.

; Definir la función "buscar-en-arbol?" usando lambda.
; Recibir como parámetros un árbol "tree" y un "elemento" a buscar.
(define buscar-en-arbol?
  (lambda (tree elemento)
    ; Evaluar si "tree" es una lista vacía.
    (if (null? tree)
        ; Retornar #f si el árbol está vacío (no se encontró el elemento).
        #f
        ; Evaluar si "elemento" es igual al valor del nodo actual obtenido con "car".
        (if (= elemento (car tree))
            ; Retornar #t si se encuentra el elemento en el nodo actual.
            #t
            ; Evaluar si "elemento" es menor que el valor del nodo actual.
            (if (< elemento (car tree))
                ; Llamar recursivamente a "buscar-en-arbol?" en el subárbol izquierdo obtenido con "cadr".
                (buscar-en-arbol? (cadr tree) elemento)
                ; Llamar recursivamente a "buscar-en-arbol?" en el subárbol derecho obtenido con "caddr".
                (buscar-en-arbol? (caddr tree) elemento))))))

; Ejecutar la función "buscar-en-arbol?" para verificar si el número 4 se encuentra en el árbol.
(displayln (buscar-en-arbol? tree 4))  ; Mostrar #t si el número 4 se encuentra en el árbol.

; Ejecutar la función "buscar-en-arbol?" para verificar si el número 7 se encuentra en el árbol.
(displayln (buscar-en-arbol? tree 7))  ; Mostrar #f si el número 7 no se encuentra en el árbol.