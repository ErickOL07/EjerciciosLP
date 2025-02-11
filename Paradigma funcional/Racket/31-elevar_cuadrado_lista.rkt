; 31. Realice un programa que eleve al cuadrado los elementos de una lista, se
; recomienda colocar los elementos en una nueva lista

#lang racket

; Define la lista inicial
(define l '(1 2 3 4 5 6 7 8 9 10))

; Función recursiva para elevar al cuadrado los elementos de una lista y crear una nueva lista
(define (listaCuadrado lst l2)
  (if (null? lst)
      l2 ; Caso base: si la lista original está vacía, devuelve la nueva lista
      (listaCuadrado (rest lst) (append l2 (list (sqr (first lst))))))) ; Eleva al cuadrado y agrega a la nueva lista

; Define la función principal
(define (main)
  (begin
    (printf "Lista 1: ~a\n" l) ; Imprime la lista original
    (let ([lista2 (listaCuadrado l '())]) ; Crea una nueva lista con los elementos al cuadrado
      (printf "\nNueva lista llena: ~a\nLista 1: ~a\n" lista2 l)))) ; Imprime la nueva lista y la original

; Llama a la función principal
(main)