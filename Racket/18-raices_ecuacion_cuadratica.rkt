; 18. Desarrollar el problema de encontrar las raíces de una ecuación cuadrática
; del tipo 𝑎𝑥^2 + 𝑏𝑥 + 𝑐 = 0, donde a,b,c son los coeficientes. Recordar la
; fórmula de ecuaciones cuadráticas:
; 𝑥 = (−𝑏 ± √(𝑏^2 − 4𝑎𝑐))/2a

#lang racket

; Define una función para devolver un par de valores
(define (values a b)
  (cons a b)) ; Devuelve los valores en un par

; Define una función para calcular las raíces de la ecuación cuadrática
(define (cuad a b c)
  (let* ([discriminante (- (sqr b) (* 4 a c))]) ; Calcula el discriminante
    (if (< discriminante 0)
        (error "No hay raíces reales.") ; Maneja el caso donde no hay raíces reales
        (values (/ (+ (- b) (sqrt discriminante)) (* 2 a)) ; Primera raíz
                (/ (- (- b) (sqrt discriminante)) (* 2 a)))))) ; Segunda raíz

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese los coeficientes a, b, c de la ecuación a*x^2 + b*x + c = 0:\n")
    (let* ([input-a (read-line)]
           [a (string->number input-a)]
           [input-b (read-line)]
           [b (string->number input-b)]
           [input-c (read-line)]
           [c (string->number input-c)])
      (if (and (number? a) (number? b) (number? c)) ; Verifica que las entradas sean números válidos
          (let* ([roots (cuad a b c)] ; Calcula las raíces
                 [r1 (car roots)]    ; Primera raíz
                 [r2 (cdr roots)])   ; Segunda raíz
            (printf "Las raíces de la ecuación son:\n~a\n~a\n" r1 r2))
          (printf "Entrada inválida. Por favor ingrese números válidos.\n")))))

; Llama a la función principal
(main)