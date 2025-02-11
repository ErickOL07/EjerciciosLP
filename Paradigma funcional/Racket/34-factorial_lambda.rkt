; 34. Realice una función que calcule el factorial de un número usando lambda.

#lang racket

; Definir la función "factorial" utilizando lambda.
; Recibir como parámetro un número "n".
(define factorial
  (lambda (n)
    ; Evaluar si "n" es igual a 0 para determinar el caso base.
    (if (= n 0)
        1  ; Retornar 1 si "n" es 0, ya que por definición 0! es 1.
        ; Multiplicar "n" por el factorial de "n - 1":
        ; Llamar recursivamente a la función "factorial" con el argumento "n - 1".
        (* n (factorial (- n 1))))))

; Mostrar en la consola el resultado del factorial de 5.
(displayln (factorial 5))