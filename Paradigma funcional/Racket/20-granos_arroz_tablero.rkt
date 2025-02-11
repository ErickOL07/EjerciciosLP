; 20. Programar una función que permita obtener una solución al clásico problema
; de los granos de arroz distribuidos en un tablero de ajedrez. En este problema
; se coloca un grano de arroz en la primera casilla de un tablero de ajedrez,
; dos granos en la segunda, 4 granos en la tercera y así sucesivamente; de tal
; manera que cada casilla contenga el doble de granos de arroz de la casilla
; anterior. Su programa deberá imprimir cuantos granos de arroz se
; necesitarían hasta llenar una casilla determinada por el usuario.

#lang racket

; Define una función recursiva para calcular el número de granos necesarios
(define (g1 n g c)
  (if (= n c)
      g ; Devuelve el número de granos cuando se alcanza la casilla deseada
      (g1 n (* g 2) (+ c 1)))) ; Multiplica los granos por 2 y avanza a la siguiente casilla

; Define una función que utiliza g1 para calcular el total de granos hasta una casilla
(define (granos n)
  (g1 n 1 1)) ; Inicia con 1 grano en la primera casilla y empieza el contador en 1

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese el número de casillas:\n")
    (let* ([input (read-line)]
           [n (string->number input)]) ; Convierte la entrada a número
      (if (and (number? n) (integer? n) (> n 0)) ; Verifica que sea un número entero positivo
          (printf "El número de granos necesarios para llenar ~a casillas es ~a.\n" n (granos n))
          (printf "Entrada inválida. Por favor ingrese un número entero positivo.\n")))))

; Llama a la función principal
(main)