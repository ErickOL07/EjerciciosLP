; 33. Obtener la raíz cuadrada de un elemento o de una lista usando map y lambda.
; Nota: Puede utilizar la instrucción list? a fin de determinar si el elemento a
; evaluar es una lista.

#lang racket

; Definir una función que calcula la raíz cuadrada de un número o de cada elemento de una lista.
(define (obtener-raiz x)
  (if (list? x)
      (map (lambda (y) (sqrt y)) x)  ; Si "x" es una lista, aplicar "sqrt" a cada elemento usando "map" y "lambda".
      (sqrt x)))                     ; Si "x" no es una lista, calcular directamente su raíz cuadrada.

; Ejemplo con una lista de números.
(define lista '(4 9 16 25))         ; Crear la lista con los números 4, 9, 16 y 25.
(define lista-raiz (obtener-raiz lista))  ; Calcular la raíz cuadrada para cada elemento de la lista.
(displayln lista-raiz)              ; Mostrar en pantalla la lista de raíces cuadradas.

; Ejemplo con un único número.
(define numero 36)                ; Definir un número.
(displayln (obtener-raiz numero))  ; Calcular y mostrar la raíz cuadrada del número.