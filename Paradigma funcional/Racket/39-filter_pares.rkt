; 39. Implemente la función filter de los lenguajes funcionales a fin de que de una
; lista se filtren los números pares.

#lang racket

; Definir la función "filtrar-pares" utilizando lambda.
; Recibir como parámetro una lista "l".
(define filtrar-pares
  (lambda (l)
    ; Evaluar si "l" está vacía.
    (if (null? l)
        ; Retornar una lista vacía si no hay elementos.
        '()
        ; Evaluar el primer elemento de "l" usando "car".
        (if (even? (car l))
            ; Incluir el elemento en el resultado si es par, utilizando "cons".
            (cons (car l) (filtrar-pares (cdr l)))
            ; Omitir el elemento y continuar procesando el resto de la lista.
            (filtrar-pares (cdr l))))))

; Definir una lista de números.
; Crear la lista con los números del 1 al 10.
(define lista '(1 2 3 4 5 6 7 8 9 10))

; Aplicar la función "filtrar-pares" a la lista para obtener solo los números pares.
(define lista-pares (filtrar-pares lista))

; Mostrar en la consola la lista resultante de números pares.
(displayln lista-pares)