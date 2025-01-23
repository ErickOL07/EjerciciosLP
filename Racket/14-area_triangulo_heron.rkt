; 14. Para calcular el área de un triángulo se puede utilizar la fórmula de Herón
; que es la siguiente: 𝑎 = √𝑠(𝑠 − 𝑎)(𝑠 − 𝑏)(𝑠 − 𝑐) donde 𝑠 es el semiperímetro
; del triángulo. El inconveniente es que para usar esta fórmula se debe de
; cumplir la llamada desigualdad triangular. La desigualdad triangular
; especifica que la sumatoria de dos lados de un triángulo debe de ser mayor que 
; ael otro lado. Usando estos conceptos realice una función que verifique primero
; si es que se cumple la desigualdad triangular y que luego proceda a calcular
; el área de un triángulo.

#lang racket

; Define una función para calcular el área de un triángulo usando la fórmula de Herón
(define (heron a b c)
  (if (or (not (> (+ a b) c)) (not (> (+ a c) b)) (not (> (+ b c) a))) ; Verifica la desigualdad triangular
      -1
      (let* ([s (/ (+ a b c) 2)]) ; Calcula el semiperímetro s
        (sqrt (* s (- s a) (- s b) (- s c)))))) ; Aplica la fórmula de Herón

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese la longitud de cada lado del triángulo:\n")
    (let* ([input-a (read-line)]
           [a (string->number input-a)]
           [input-b (read-line)]
           [b (string->number input-b)]
           [input-c (read-line)]
           [c (string->number input-c)])
      (if (and (number? a) (number? b) (number? c)) ; Verifica si las entradas son números válidos
          (if (= (heron a b c) -1)
              (printf "No se cumple con la desigualdad triangular.\n")
              (printf "El área del triángulo con la fórmula de Herón es:\n√[~a * (~a - ~a) * (~a - ~a) * (~a - ~a)] = ~a\n"
                      (/ (+ a b c) 2) (/ (+ a b c) 2) a (/ (+ a b c) 2) b (/ (+ a b c) 2) c (heron a b c)))
          (printf "Entrada inválida. Por favor ingrese números válidos.\n")))))

; Llama a la función principal
(main)