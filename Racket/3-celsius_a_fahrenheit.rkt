; 3. Realice un programa que permita la conversión de grados C a grados F según
; la siguiente fórmula:
; F = C*9/5 + 32

#lang racket

; Define una función para convertir grados Celsius a Fahrenheit
(define (convF c)
  (+ (* c 9/5) 32))

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese el valor en grados C: ")
    (let* ([input (read-line)]                      ; Lee una línea de entrada del usuario
           [n1 (string->number input)])             ; Convierte la entrada a número
      (if (number? n1)                              ; Verifica que la entrada sea un número válido
          (printf "~a grados C = ~a grados F\n" n1 (convF n1)) ; Imprime la conversión
          (printf "Entrada inválida. Por favor ingrese un número.\n")))))

; Llama a la función principal
(main)
