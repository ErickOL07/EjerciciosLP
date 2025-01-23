; 13. Escriba una función que permita determinar si una palabra es palíndroma o
; no. Busque cómo utilizar la función reverse.

#lang racket

; Define una función para determinar si una palabra es palíndroma
(define (palindromo p)
  (if (string=? (string-reverse p) p)
      "La palabra es palíndroma."
      "La palabra no es palíndroma."))

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese una palabra:\n")
    (let ([input (read-line)]) ; Lee la palabra como una cadena
      (printf "~a\n" (palindromo input))))) ; Llama a la función palindromo e imprime el resultado

; Llama a la función principal
(main)