; 38. Implemente la función map usando lambda y aplíquela a una programa que
; eleve al cuadrado los elementos de una lista.

#lang racket

; Definir la función "map-lambda" usando lambda que recibe una función "f" y una lista "l".
(define map-lambda
  (lambda (f l)
    ; Verificar si "l" está vacía.
    (if (null? l)
        ; Retornar una lista vacía si "l" no tiene elementos.
        '()
        ; Aplicar la función "f" al primer elemento de "l" y concatenar el resultado con
        ; la aplicación recursiva de "map-lambda" al resto de la lista.
        (cons (f (car l)) (map-lambda f (cdr l))))))

; Definir una lista de números.
(define lista '(1 2 3 4 5))  ; Crear una lista con los números 1, 2, 3, 4 y 5.

; Aplicar "map-lambda" a la lista utilizando una función lambda que eleva al cuadrado cada elemento.
(define lista-cuadrados
  (map-lambda (lambda (x) (* x x)) lista))  ; Elevar cada "x" al cuadrado.

; Mostrar en la consola la lista resultante con los cuadrados de cada elemento.
(displayln lista-cuadrados)
