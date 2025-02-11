; 2. Obtener
; [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10]

#lang racket

; Define una lista con números del -10 al 10
(define lista
  (range -10 11)) ; `range` genera números desde -10 hasta 10 (el límite superior es exclusivo, por eso usamos 11)

; Define la función principal para imprimir la lista
(define (main)
  (printf "Lista: ~a\n" lista))

; Llama a la función principal
(main)