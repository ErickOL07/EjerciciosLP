; 7. Se desea obtener el área de una circunferencia mediante una función que
; reciba el radio. Ingresar el dato por teclado.

#lang racket

; Define una función para calcular el área de una circunferencia
(define (areaC r)
  (* pi (sqr r))) ; Calcula el área usando pi * r^2

; Define la función principal
(define (main)
  (begin
    (printf "Ingrese el radio:\n")
    (let* ([input (read-line)]         ; Lee el valor del radio como una cadena
           [r (string->number input)]) ; Convierte la cadena a número
      (if (number? r)                  ; Verifica si la entrada es un número válido
          (printf "El área de la circunferencia es: pi * ~a^2 = ~a\n" r (areaC r))
          (printf "Entrada inválida. Por favor ingrese un número.\n")))))

; Llama a la función principal
(main)
