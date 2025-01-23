; 9. Hacer un programa que permita recibir las coordenadas de dos puntos, su
; programa deberá devolver la distancia euclideana entre estos dos puntos.
; d = √((x2 - x1)² + (y2 - y1)²)

#lang racket

; Define una función para calcular la distancia euclidiana entre dos puntos
(define (distancia x1 y1 x2 y2)
  (sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1))))) ; Calcula la distancia euclidiana

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese las coordenadas del primer punto:\n")
    (let* ([input-x1 (read-line)]                      ; Lee la coordenada x1
           [x1 (string->number input-x1)])             ; Convierte a número
      (if (not (number? x1))
          (printf "Entrada inválida para x1. Por favor ingrese un número.\n")
          (begin
            (printf "Ingrese la coordenada y1:\n")
            (let* ([input-y1 (read-line)]              ; Lee la coordenada y1
                   [y1 (string->number input-y1)])     ; Convierte a número
              (if (not (number? y1))
                  (printf "Entrada inválida para y1. Por favor ingrese un número.\n")
                  (begin
                    (printf "Ingrese las coordenadas del segundo punto:\n")
                    (let* ([input-x2 (read-line)]      ; Lee la coordenada x2
                           [x2 (string->number input-x2)]) ; Convierte a número
                      (if (not (number? x2))
                          (printf "Entrada inválida para x2. Por favor ingrese un número.\n")
                          (begin
                            (printf "Ingrese la coordenada y2:\n")
                            (let* ([input-y2 (read-line)] ; Lee la coordenada y2
                                   [y2 (string->number input-y2)]) ; Convierte a número
                              (if (not (number? y2))
                                  (printf "Entrada inválida para y2. Por favor ingrese un número.\n")
                                  (printf "La distancia euclidiana entre los puntos (~a; ~a) y (~a; ~a) es:\nd = ~a\n"
                                          x1 y1 x2 y2 (distancia x1 y1 x2 y2)))))))))))))))

; Llama a la función principal
(main)