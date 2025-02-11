; 37. Realice una función que realice el recorrido inorder de un BST.

#lang racket

; Definir la función "inorder" utilizando lambda para recibir un BST.
(define inorder
  (lambda (bst)
    ; Verificar si el BST está vacío.
    (if (null? bst)
        ; Retornar una lista vacía cuando el BST no contiene nodos.
        '()
        ; Concatenar el recorrido inorder del subárbol izquierdo, el valor del nodo actual y el recorrido inorder del subárbol derecho.
        (append (inorder (cadr bst))   ; Recorrer el subárbol izquierdo.
                (list (car bst))        ; Incluir el valor del nodo actual.
                (inorder (caddr bst)))))) ; Recorrer el subárbol derecho.

; Definir un BST de ejemplo usando listas.
(define tree '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ()))))

; Ejecutar la función "inorder" sobre el BST para obtener el recorrido inorder.
(displayln (inorder tree))  ; Mostrar en la consola la lista resultante del recorrido: (1 3 4 5 6 8 9).