; 15. Desarrollar una función que dado un número de tres dígitos nos imprima la
; sumatoria de estos dígitos.

#lang racket

; Define una función para calcular la sumatoria de los dígitos de un número
(define (sumDig n)
  (if (= n 0)
      0
      (+ (modulo n 10) (sumDig (quotient n 10))))) ; Calcula el último dígito y llama recursivamente con el resto

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese un número de 3 dígitos:\n")
    (let* ([input (read-line)]         ; Lee la entrada como una cadena
           [n (string->number input)]) ; Convierte la cadena a un número
      (if (and (number? n) (integer? n) (>= n 100) (<= n 999)) ; Verifica que sea un número entero de 3 dígitos
          (printf "La suma de los dígitos es: ~a\n" (sumDig n)) ; Calcula y muestra la sumatoria
          (printf "Entrada inválida. Por favor ingrese un número de 3 dígitos.\n")))))

; Llama a la función principal
(main)