; 43. Defina una función que permita elevar un número a una potencia
; determinada. Utilice currying para que se llame cada función con un solo
; argumento a la vez; algo parecido a:
; (define square (curry-power 2))
; (square 3)
; Nota: En su programa puede usar la instrucción expt.

#lang racket

; Definir la función "curry-power" usando lambda.
; Recibir como parámetro la potencia "p".
(define curry-power
  (lambda (p)
    ; Recibir como parámetro el número "x" al cual se le aplicará la potencia "p".
    (lambda (x)
      ; Calcular y retornar el resultado de elevar "x" a la potencia "p" usando expt.
      (expt x p))))

; Definir la función "square" asignando el resultado de aplicar "curry-power" a 2.
; Esto crea una función que eleva cualquier número al cuadrado.
(define square (curry-power 2))

; Mostrar en la consola el resultado de elevar 3 al cuadrado usando la función "square".
(displayln (square 3))  ; Mostrar 9, ya que 3^2 = 9.
