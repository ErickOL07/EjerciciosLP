; 32. Adicionar tres a cada elemento de una lista de número usando map y lambda.

#lang racket

; Definir una función de alto orden que toma un número "x" y devuelve una función lambda.
(define (suma x)
  (lambda (y)
    (+ x y)))  ; La función lambda recibe "y" y retorna la suma de "x" y "y".

; Crear la función "sumale3" usando "suma" para que, al aplicarse, sume 3 a su argumento.
(define sumale3
  (suma 3))  ; "sumale3" es una función que añade 3 a cualquier número.

; Definir una lista de números a la que se le aplicará la suma de 3.
(define lista '(1 2 3 4 5))  ; Se crea la lista con los números 1, 2, 3, 4 y 5.

; Usar "map" para aplicar la función "sumale3" a cada elemento de la lista.
(define lista-sumada
  (map sumale3 lista))  ; Para cada elemento de "lista", se le añade 3, generando "lista-sumada".

; Imprimir la lista resultante en la consola.
(displayln lista-sumada)  ; Mostrar en pantalla la lista donde cada elemento ha sido incrementado en 3.
