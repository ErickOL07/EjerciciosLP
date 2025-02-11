; 12. Un año se dice que es bisiesto si es su representación numérica da una división
; exacta cuando es divisble por 4 y no por 100 al mismo tiempo o si es divisible
; entre 400. Haga un programa que Haskell que permita determinar si un año
; es bisiesto.

#lang racket

; Define una función para determinar si un año es bisiesto
(define (bisiesto n)
  (cond
    [(and (= (modulo n 4) 0) (not (= (modulo n 100) 0))) #t] ; Divisible por 4 y no por 100
    [(= (modulo n 400) 0) #t]                             ; Divisible por 400
    [else #f]))                                           ; No es bisiesto

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese un año:\n")
    (let* ([input (read-line)]         ; Lee el año como una cadena
           [n (string->number input)]) ; Convierte la cadena a número
      (if (and (number? n) (integer? n)) ; Verifica si es un número entero válido
          (begin
            (printf "~a\n" (bisiesto n)) ; Imprime `#t` o `#f` según el resultado
            (if (bisiesto n)
                (printf "Es bisiesto.\n")
                (printf "No es bisiesto.\n")))
          (printf "Entrada inválida. Por favor ingrese un número entero.\n")))))

; Llama a la función principal
(main)