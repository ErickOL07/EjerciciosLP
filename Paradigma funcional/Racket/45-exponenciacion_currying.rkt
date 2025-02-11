; 45. Modifique su programa de la exponenciación usando recursividad y currying.

#lang racket

; Definir la función "curry-power-recursive" usando lambda.
; Recibir como parámetro la potencia "p".
(define curry-power-recursive
  (lambda (p)
    ; Retornar una función lambda que reciba el número "x".
    (lambda (x)
      ; Definir la función recursiva auxiliar "exp-rec" que calcule x^n.
      (define (exp-rec n)
        ; Evaluar si "n" es igual a 0 para determinar el caso base.
        (if (= n 0)
            ; Retornar 1 si "n" es 0.
            1
            ; Multiplicar "x" por el resultado de llamar recursivamente a "exp-rec" con "n - 1".
            (* x (exp-rec (- n 1)))))
      ; Llamar a "exp-rec" con el exponente "p" y retornar el resultado.
      (exp-rec p))))

; Definir la función "square" aplicando "curry-power-recursive" con el exponente 2.
(define square (curry-power-recursive 2))

; Mostrar en la consola el resultado de elevar 3 al cuadrado utilizando "square".
(displayln (square 3))  ; Debería mostrar 9, ya que 3^2 = 9.