; 11. Realice un programa que imprima el valor absoluto de un número.

#lang racket

; Define una función para calcular el valor absoluto de un número
(define (abs1 n)
  (if (< n 0)
      (- n)
      n))

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese un número:\n")
    (let* ([input (read-line)]         ; Lee la entrada como una cadena
           [n (string->number input)]) ; Convierte la cadena a un número
      (if (and (number? n) (integer? n)) ; Verifica que sea un número entero válido
          (printf "|~a| = ~a\ncon abs: abs(~a) = ~a\n"
                  n (abs1 n) n (abs n)) ; Muestra los resultados de `abs1` y `abs`
          (printf "Entrada inválida. Por favor ingrese un número entero.\n")))))

; Llama a la función principal
(main)