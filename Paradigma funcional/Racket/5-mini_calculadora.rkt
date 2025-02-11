; 5. Realice un programa que permita obtener una mini calculadora que realice
; las operaciones aritméticas fundamentales de suma, resta, multplicación y
; división

#lang racket

; Define funciones para las operaciones aritméticas fundamentales
(define (adicion a b)
  (+ a b))

(define (sustraccion a b)
  (- a b))

(define (multiplicacion a b)
  (* a b))

(define (division a b)
  (if (= b 0)
      "Error: División por cero"
      (/ a b)))

; Define la función principal
(define (main)
  (begin
    (printf "Seleccione la operación a realizar:\n1. Adición\n2. Sustracción\n3. Multiplicación\n4. División\n")
    (let* ([opc (string->number (read-line))]) ; Lee la operación seleccionada
      (if (or (not (number? opc)) (not (member opc '(1 2 3 4))))
          (printf "No se seleccionó ninguna operación válida.\n")
          (begin
            (printf "Indique el primer número: ")
            (let* ([n1 (string->number (read-line))]) ; Lee el primer número
              (if (not (number? n1))
                  (printf "Entrada inválida para el primer número.\n")
                  (begin
                    (printf "Indique el segundo número: ")
                    (let* ([n2 (string->number (read-line))]) ; Lee el segundo número
                      (if (not (number? n2))
                          (printf "Entrada inválida para el segundo número.\n")
                          (cond
                            [(= opc 1) (printf "~a + ~a = ~a\n" n1 n2 (adicion n1 n2))]
                            [(= opc 2) (printf "~a - ~a = ~a\n" n1 n2 (sustraccion n1 n2))]
                            [(= opc 3) (printf "~a * ~a = ~a\n" n1 n2 (multiplicacion n1 n2))]
                            [(= opc 4) (printf "~a / ~a = ~a\n" n1 n2 (division n1 n2))]
                            [else (printf "No se seleccionó ninguna operación válida.\n")])))))))))))

; Llama a la función principal
(main)