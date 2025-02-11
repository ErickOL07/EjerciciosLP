; 23. Existen algunos números que si elevamos cada uno de sus dígitos a la potencia
; de su ubicación y sumamos sus resultados nos devuelve el mismo número.
; Por ejemplo, si ingresamos 135 la sumatoria de la potencia de sus dígitos
; sería la siguiente 1
; 1 + 3
; 2 + 5
; 3 = 1 + 9 + 125 = 135, realizar un programa
; que devuelva verdadero si se cumple esta propiedad y falso en caso contrario.

#lang racket

; Función para contar el número de dígitos en un número
(define (digitos n c)
  (cond
    [(and (= n 0) (not (= c 0))) c] ; Caso base: si n es 0 y c no es 0, devuelve el contador
    [(and (= n 0) (= c 0)) 1]       ; Caso base: si n es 0 y c es 0, devuelve 1 (número 0 tiene un dígito)
    [else (digitos (quotient n 10) (+ c 1))])) ; Llama recursivamente contando los dígitos

; Función recursiva para calcular la suma de los dígitos elevados a su posición
(define (e1 n d s)
  (if (= n 0)
      s ; Caso base: devuelve la suma acumulada
      (e1 (quotient n 10)
          (- (digitos n 0) 1) ; Calcula la posición del dígito
          (+ s (expt (modulo n 10) (digitos n 0)))))) ; Eleva el dígito a la potencia de su posición y lo suma

; Función para verificar si un número cumple la propiedad especial
(define (especial n)
  (if (= (e1 n 0 0) n)
      "Verdadero"
      "Falso"))

; Función principal
(define (main)
  (begin
    (printf "Ingrese un número:\n")
    (let* ([input (read-line)]
           [n (string->number input)]) ; Convierte la entrada a número
      (if (and (number? n) (integer? n)) ; Verifica si es un número entero válido
          (printf "~a\n" (especial n)) ; Imprime si el número cumple la propiedad especial
          (printf "Entrada inválida. Por favor ingrese un número entero.\n")))))

; Llama a la función principal
(main)