; 16. Escriba un programa en Haskell que lea una nota por teclado, de 0 a 100, y
; que luego escriba su equivalente en letras según la siguiente escala:
; A: 90-100
; B: 80-89
; C: 70-79
; D: 60-69
; F: Menor a 60

#lang racket

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese un número del 0 al 100:\n")
    (let* ([input (read-line)]         ; Lee la entrada como una cadena
           [n (string->number input)]) ; Convierte la cadena a un número
      (if (and (number? n) (integer? n) (>= n 0) (<= n 100)) ; Verifica que sea un número entero entre 0 y 100
          (cond
            [(and (>= n 90) (<= n 100)) (printf "A\n")]
            [(and (>= n 80) (<= n 89)) (printf "B\n")]
            [(and (>= n 70) (<= n 79)) (printf "C\n")]
            [(and (>= n 60) (<= n 69)) (printf "D\n")]
            [(< n 60) (printf "F\n")])
          (printf "El número debe ser de 0 a 100.\n")))))

; Llama a la función principal
(main)
