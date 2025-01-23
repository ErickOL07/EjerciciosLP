; 17. Considere tres números enteros, realice una función que imprima cual de esos
; números es el mayor.

#lang racket

; Define una función para determinar el mayor de tres números
(define (mayor n1 n2 n3)
  (cond
    [(and (>= n1 n2) (>= n1 n3)) n1] ; Si n1 es mayor o igual a n2 y n3
    [(and (>= n2 n1) (>= n2 n3)) n2] ; Si n2 es mayor o igual a n1 y n3
    [else n3]))                     ; Si n3 es el mayor

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese 3 números:\n")
    (let* ([input1 (read-line)]
           [n1 (string->number input1)]
           [input2 (read-line)]
           [n2 (string->number input2)]
           [input3 (read-line)]
           [n3 (string->number input3)])
      (if (and (number? n1) (integer? n1)
               (number? n2) (integer? n2)
               (number? n3) (integer? n3)) ; Verifica que todos sean números enteros
          (printf "El mayor de los 3 números es: ~a\n" (mayor n1 n2 n3))
          (printf "Entrada inválida. Por favor ingrese solo números enteros.\n")))))

; Llama a la función principal
(main)