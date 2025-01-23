; 26. Realizar un programa que permita determinar si un número es primo.

#lang racket

; Define una función recursiva para determinar si un número es primo
(define (p1 n r c)
  (cond
    [(and (= (modulo n r) 0) (= (+ c 1) 2) (= (- r 1) 0)) "El número es primo."] ; Caso base: es primo
    [(= (modulo n r) 0) (p1 n (- r 1) (+ c 1))] ; Si es divisible, incrementa el contador y verifica el siguiente divisor
    [(> c 2) "El número no es primo."] ; Si hay más de dos divisores, no es primo
    [else (p1 n (- r 1) c)])) ; Continua verificando el siguiente divisor

; Define una función para iniciar la verificación de si un número es primo
(define (esPrimo n)
  (p1 n n 0)) ; Inicia la verificación con el número \( n \), el divisor \( r = n \), y el contador \( c = 0 \)

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese un número:\n")
    (let* ([input (read-line)]
           [n (string->number input)]) ; Convierte la entrada a número
      (if (and (number? n) (integer? n) (> n 1)) ; Verifica si es un número entero mayor a 1
          (printf "~a\n" (esPrimo n)) ; Imprime si el número es primo o no
          (printf "Entrada inválida. Por favor ingrese un número entero mayor a 1.\n")))))

; Llama a la función principal
(main)