; 21. Desarrollar una función que indique cuantos dígitos tiene un número
; determinado.

#lang racket

; Define una función recursiva para contar los dígitos de un número
(define (d1 n c)
  (cond
    [(and (= n 0) (not (= c 0))) c] ; Caso base: si n es 0 y ya hay un contador, devuelve c
    [(and (= n 0) (= c 0)) 1]       ; Caso base: si n es 0 y c es 0, devuelve 1 (número 0 tiene un dígito)
    [else (d1 (quotient n 10) (+ c 1))])) ; Llama recursivamente dividiendo n por 10 y aumentando el contador

; Define una función que utiliza d1 para contar los dígitos
(define (digitos n)
  (d1 n 0))

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese un número:\n")
    (let* ([input (read-line)]
           [n (string->number input)]) ; Convierte la entrada a número
      (if (and (number? n) (integer? n)) ; Verifica que sea un número entero válido
          (printf "El número ~a tiene ~a dígitos.\n" n (digitos (abs n))) ; Calcula los dígitos del valor absoluto
          (printf "Entrada inválida. Por favor ingrese un número entero.\n")))))

; Llama a la función principal
(main)