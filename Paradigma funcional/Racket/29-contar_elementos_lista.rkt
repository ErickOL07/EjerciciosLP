; 29. Contar los elementos de una lista usando recursividad simple y tail recursión.

#lang racket

; Define una lista de ejemplo
(define l '(1 2 3 4 5))

; Función recursiva de cola para contar los elementos de una lista
(define (c1 lst c)
  (if (null? lst)
      c ; Caso base: si la lista está vacía, devuelve el contador acumulado
      (c1 (rest lst) (+ c 1)))) ; Incrementa el contador y llama recursivamente con el resto de la lista

; Función para iniciar el conteo con un contador inicial de 0
(define (contarL lst)
  (c1 lst 0))

; Define la función principal
(define (main)
  (printf "La lista ~a tiene ~a elementos.\n" l (contarL l)))

; Llama a la función principal
(main)