; 25. Calcular el resultado de la siguiente serie:
; 1 + 1/2 + 1/3 + ... + 1/n

#lang racket

; Define una función recursiva de cola para calcular la serie
(define (s1 n c r)
  (cond
    [(= n c) r] ; Caso base: si c es igual a n, devuelve el resultado acumulado
    [(= n 0) (s1 n 1 1)] ; Si n es 0, inicia la serie con 1
    [else (s1 n (+ c 1) (+ r (/ 1 (+ c 1))))])) ; Suma 1/(c+1) al acumulador y avanza

; Define una función para iniciar el cálculo de la serie
(define (serie n)
  (s1 n 0 0)) ; Inicia con c = 0 y r = 0

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese un número:\n")
    (let* ([input (read-line)]         ; Lee la entrada como una cadena
           [n (string->number input)]) ; Convierte la cadena a número
      (if (and (number? n) (>= n 1)) ; Verifica si es un número válido y n >= 1
          (printf "El resultado de la serie es: ~a\n" (serie n)) ; Calcula e imprime el resultado
          (printf "Entrada inválida. Por favor ingrese un número mayor o igual a 1.\n")))))

; Llama a la función principal
(main)