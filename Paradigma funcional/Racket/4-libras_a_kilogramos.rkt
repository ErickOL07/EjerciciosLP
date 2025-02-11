; 4. De forma similar al problema anterior realice un convertor de libras a
; kilogramos, recordar que una libra es igual a 0.45 kilogramos.

#lang racket

; Define una función para convertir libras a kilogramos
(define (convLb lb)
  (* lb 0.45)) ; Una libra equivale a 0.45 kilogramos

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese la cantidad de libras: ")
    (let* ([input (read-line)]                      ; Lee la entrada del usuario como una cadena
           [n (string->number input)])              ; Convierte la cadena a número
      (if (number? n)                               ; Verifica si la entrada es un número válido
          (printf "~a lb son ~a kg.\n" n (convLb n)) ; Imprime la conversión
          (printf "Entrada inválida. Por favor ingrese un número.\n")))))

; Llama a la función principal
(main)