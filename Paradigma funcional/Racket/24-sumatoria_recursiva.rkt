; 24. Calcular el resultado de la siguiente sumatoria: 1 + 2 + 3 … + 𝑛 usando
; recursividad simple y tail recursión.

#lang racket

; Define una función recursiva de cola para calcular la sumatoria
(define (s1 n c r)
  (if (= c n)
      r ; Caso base: si c es igual a n, devuelve el resultado acumulado
      (s1 n (+ c 1) (+ r c)))) ; Suma el contador al acumulador y avanza recursivamente

; Define una función para iniciar la sumatoria
(define (suma n)
  (s1 n 0 0)) ; Llama a s1 con el contador y acumulador inicializados en 0

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese un número:\n")
    (let* ([input (read-line)]         ; Lee la entrada como una cadena
           [n (string->number input)]) ; Convierte la cadena a número
      (if (and (number? n) (integer? n) (>= n 0)) ; Verifica si es un número entero positivo
          (printf "El resultado de la sumatoria es: ~a\n" (suma n)) ; Calcula e imprime la sumatoria
          (printf "Entrada inválida. Por favor ingrese un número entero positivo.\n")))))

; Llama a la función principal
(main)