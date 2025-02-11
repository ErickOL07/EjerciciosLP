; 22. Se nos solicita desarrollar un programa que, mediante una función, devuelva
; la sumatoria de los dígitos que constituyen un número. Por ejemplo, si
; ingresamos el número 154, el programa deberá imprimir la sumatoria de
; 1+5+4=10.

#lang racket

; Define una función recursiva para calcular la sumatoria de los dígitos de un número
(define (s1 n s)
  (if (= n 0)
      s ; Caso base: si el número es 0, devuelve la suma acumulada
      (s1 (quotient n 10) (+ s (modulo n 10))))) ; Suma el último dígito y avanza al siguiente

; Define una función para iniciar la sumatoria con 0
(define (sumDig n)
  (s1 n 0))

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese un número:\n")
    (let* ([input (read-line)]         ; Lee la entrada como una cadena
           [n (string->number input)]) ; Convierte la cadena a número
      (if (and (number? n) (integer? n)) ; Verifica que sea un número entero válido
          (printf "La suma de dígitos del número ~a es ~a.\n" n (sumDig (abs n))) ; Calcula y muestra la sumatoria
          (printf "Entrada inválida. Por favor ingrese un número entero.\n")))))

; Llama a la función principal
(main)