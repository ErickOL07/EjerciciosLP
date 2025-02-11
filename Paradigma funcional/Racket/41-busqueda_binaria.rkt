; 41. Implementar el algoritmo de búsqueda binaria.
; Nota: Utilice let para asignar valores a los índices del extremo izquierdo,
; medio y derecho.

#lang racket

; Definir la función "busqueda-binaria" utilizando lambda que reciba una lista ordenada "l" y un "elemento" a buscar.
(define busqueda-binaria
  (lambda (l elemento)
    ; Definir la función interna "buscar" utilizando lambda que reciba dos parámetros: "izq" y "der", representando los índices del extremo izquierdo y derecho.
    (define buscar
      (lambda (izq der)
        ; Evaluar si "izq" es mayor que "der"; en ese caso, retornar #f ya que el elemento no se encuentra.
        (if (> izq der)
            #f
            ; Utilizar let para asignar:
            ; - "medio" como el índice central, calculado como la división entera de (izq + der) entre 2.
            ; - "valor-medio" como el elemento de "l" en la posición "medio".
            (let ([medio (quotient (+ izq der) 2)]
                  [valor-medio (list-ref l medio)])
              ; Evaluar si "valor-medio" es igual a "elemento"; si es así, retornar #t.
              (cond
                [(= valor-medio elemento) #t]
                ; Evaluar si "elemento" es menor que "valor-medio"; si es así, llamar recursivamente a "buscar" en el subintervalo izquierdo, de "izq" a "medio - 1".
                [(< elemento valor-medio) (buscar izq (- medio 1))]
                ; Llamar recursivamente a "buscar" en el subintervalo derecho, de "medio + 1" a "der", en caso contrario.
                [else (buscar (+ medio 1) der)]))))))
    ; Iniciar la búsqueda llamando a "buscar" con "izq" igual a 0 y "der" igual a la longitud de "l" menos 1.
    (buscar 0 (- (length l) 1)))

; Definir una lista ordenada de números.
(define lista-ordenada '(1 3 5 7 9 11 13 15 17 19))

; Buscar el número 7 en "lista-ordenada" e imprimir el resultado.
(displayln (busqueda-binaria lista-ordenada 7))  ; Mostrar #t si se encuentra el elemento.

; Buscar el número 8 en "lista-ordenada" e imprimir el resultado.
(displayln (busqueda-binaria lista-ordenada 8))  ; Mostrar #f si no se encuentra el elemento.
