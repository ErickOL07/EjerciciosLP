; 28. Implemente una función que calcule la sumatoria de los números que se
; encuentran en una lista.

#lang racket

; Define una lista de ejemplo
(define l '(1 2 3 4 5))

; Función recursiva para calcular la sumatoria de los elementos de una lista
(define (sL lst s)
  (if (null? lst)
      s ; Caso base: si la lista está vacía, devuelve la suma acumulada
      (sL (rest lst) (+ (first lst) s)))) ; Suma el primer elemento al acumulador y continúa con el resto

; Función para iniciar la sumatoria con un acumulador inicial de 0
(define (sumatoriaL lst)
  (sL lst 0))

; Define la función principal
(define (main)
  (printf "La sumatoria de la lista ~a es: ~a\n" l (sumatoriaL l)))

; Llama a la función principal
(main)