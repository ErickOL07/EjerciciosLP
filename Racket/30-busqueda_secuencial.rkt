; 30. Programe el algoritmo de búsqueda secuencial usando recursividad.

#lang racket

; Define la lista de ejemplo
(define l '(1 3 5 7 11 13 17 19))

; Función recursiva para buscar el índice de un elemento en la lista
(define (bi1 lst e i)
  (cond
    [(null? lst) (error "No se encontró el elemento.")] ; Caso base: elemento no encontrado
    [(= (first lst) e) i]                              ; Caso base: el elemento coincide
    [else (bi1 (rest lst) e (+ i 1))]))                ; Llama recursivamente con el resto de la lista

; Función recursiva para buscar el elemento en la lista dado un índice
(define (be1 lst i c)
  (cond
    [(null? lst) (error "No se encontró el elemento.")] ; Caso base: índice fuera de rango
    [(= c i) (first lst)]                               ; Caso base: índice coincide
    [else (be1 (rest lst) i (+ c 1))]))                 ; Llama recursivamente con el resto de la lista

; Función para buscar el índice de un elemento
(define (buscarIndice lst e)
  (bi1 lst e 0)) ; Inicia la búsqueda con el índice en 0

; Función para buscar el elemento dado un índice
(define (buscarElemento lst i)
  (be1 lst i 0)) ; Inicia la búsqueda con el contador en 0

; Función principal
(define (main)
  (begin
    (printf "Buscar en la lista ~a\n1. Índice por elemento\n2. Elemento por índice\n" l)
    (let* ([input (read-line)]         ; Lee la opción ingresada
           [op (string->number input)]) ; Convierte la opción a número
      (cond
        [(= op 1)
         (begin
           (printf "\nIngrese el elemento a buscar:\n")
           (let* ([input-e (read-line)]
                  [e (string->number input-e)]) ; Convierte el elemento a número
             (if (number? e)
                 (printf "Resultado de la búsqueda: ~a\n" (buscarIndice l e))
                 (printf "Entrada inválida.\n"))))]
        [(= op 2)
         (begin
           (printf "\nIngrese el índice del elemento a buscar:\n")
           (let* ([input-i (read-line)]
                  [i (string->number input-i)]) ; Convierte el índice a número
             (if (and (number? i) (integer? i) (>= i 0))
                 (printf "Resultado de la búsqueda: ~a\n" (buscarElemento l i))
                 (printf "Entrada inválida.\n"))))]
        [else (printf "\nOpción inválida.\n")]))))

; Llama a la función principal
(main)