; 10. Escribir un programa que pida ingresar un número y devuelva si es par o
; impar. Usar función even de Haskell.

#lang racket

; Define una función para verificar si un número es par o impar
(define (esPar n)
  (if (even? n)
      "El número es par"
      "El número es impar"))

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese un número:\n")
    (let* ([input (read-line)]         ; Lee la entrada como una cadena
           [n (string->number input)]) ; Convierte la cadena a un número
      (if (and (number? n) (integer? n)) ; Verifica si es un número entero válido
          (printf "~a\n" (esPar n))    ; Llama a la función esPar y muestra el resultado
          (printf "Entrada inválida. Por favor ingrese un número entero.\n")))))

; Llama a la función principal
(main)