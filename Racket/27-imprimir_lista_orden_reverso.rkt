; 27. Realizar un par de funciones que impriman los elementos de una lista usando
; recursividad, una de su funciones deberá imprimir los elementos en orden.
; Para este programa se recomienda leer los elementos de la lista y usar cons
; para simular la impresión de los elementos. Modifique luego su función de
; imprimir los datos en reversa usando append.

#lang racket

; Define una lista de ejemplo
(define l '(1 2 3 4))

; Función recursiva para imprimir los elementos en orden
(define (imprimirL lst)
  (if (null? lst)
      '() ; Caso base: si la lista está vacía, devuelve una lista vacía
      (cons (first lst) (imprimirL (rest lst))))) ; Agrega el primer elemento y llama recursivamente con el resto

; Función recursiva para imprimir los elementos en orden inverso
(define (invertirL lst)
  (if (null? lst)
      '() ; Caso base: si la lista está vacía, devuelve una lista vacía
      (append (invertirL (rest lst)) (list (first lst))))) ; Llama recursivamente con el resto y agrega el primer elemento al final

; Define la función principal
(define (main)
  (printf "Lista original: ~a\n" (imprimirL l)) ; Imprime la lista en orden
  (printf "Lista invertida: ~a\n" (invertirL l))) ; Imprime la lista en orden inverso

; Llama a la función principal
(main)