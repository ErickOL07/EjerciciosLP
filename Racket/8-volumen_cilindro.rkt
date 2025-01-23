; 8. Se nos pide calcular el volumen de un cilindro mediante una función que
; reciba el radio de la circunferencia de la base y la altura. La fórmula para
; calcular el volumen es: 𝑉 = 𝐴𝑐𝑖𝑟𝑐 ∗ ℎ y para calcular el área de la
; circunferencia la fórmula es pi*r^2

#lang racket

; Define una función para calcular el volumen del cilindro
(define (volumenC r h)
  (* (* pi (sqr r)) h)) ; Calcula el volumen usando V = pi * r^2 * h

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese el radio de la circunferencia:\n")
    (let* ([input-r (read-line)]                      ; Lee el radio como una cadena
           [r (string->number input-r)])              ; Convierte la cadena a número
      (if (not (number? r))
          (printf "Entrada inválida para el radio. Por favor ingrese un número.\n")
          (begin
            (printf "Ingrese la altura del cilindro:\n")
            (let* ([input-h (read-line)]              ; Lee la altura como una cadena
                   [h (string->number input-h)])      ; Convierte la cadena a número
              (if (not (number? h))
                  (printf "Entrada inválida para la altura. Por favor ingrese un número.\n")
                  (printf "El volumen del cilindro con radio ~a y altura ~a es: ~a\n" 
                          r h (volumenC r h)))))))))

; Llama a la función principal
(main)