; 19. Desarrollar una función recursiva que permita determinar si un número es
; perfecto. Un número es perfecto cuando la sumatoria de sus divisores,
; exceptuando al mismo número, da el número que se desea evaluar. Por
; ejemplo, el número 6 tiene como divisores 1,2,3 y 6; sumando los primeros
; números tendríamos: 6=1+2+3.

#lang racket

; Define una función recursiva para calcular la sumatoria de los divisores de un número
(define (divs n d c)
  (if (= d 0)
      c ; Devuelve la suma de los divisores acumulados
      (if (= (modulo n d) 0) ; Verifica si `d` es divisor de `n`
          (divs n (- d 1) (+ c d)) ; Suma el divisor y continúa recursivamente
          (divs n (- d 1) c)))) ; No suma el divisor y continúa recursivamente

; Define una función para verificar si un número es perfecto
(define (perfecto n)
  (if (= (divs n (- n 1) 0) n) ; Compara la suma de los divisores con el número
      "El número es perfecto"
      "El número no es perfecto"))

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese un número:\n")
    (let* ([input (read-line)]
           [n (string->number input)]) ; Convierte la entrada a número
      (if (and (number? n) (integer? n) (> n 0)) ; Verifica que la entrada sea un entero positivo
          (printf "~a\n" (perfecto n)) ; Verifica y muestra si el número es perfecto
          (printf "Entrada inválida. Por favor ingrese un número entero positivo.\n")))))

; Llama a la función principal
(main)