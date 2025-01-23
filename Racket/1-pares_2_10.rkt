; 1. Obtener una lista con los números pares del 2 al 10, use list comprehension.

#lang racket

; Define una función para obtener los números pares del 2 al 10
(define pares
  (filter even? (range 2 11))) ; `range` en Racket genera una lista desde 2 hasta 10 (el límite superior no es inclusivo, por eso usamos 11)

; Define el main para imprimir la lista de números pares
(define (main)
  (printf "Pares: ~a\n" pares))

; Llama a la función principal
(main)
