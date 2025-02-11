; 40. Realice una función que invierta los dígitos de un número. Trate de usar let
; para almacenar el residuo de un número al ser dividido entre 10 en una
; variable, y lambda en su solución.
; Nota: En esta solución puede almacenar los dígitos en una lista.

#lang racket

; Definir la función "invertir-digitos" usando lambda para recibir el número "n".
(define invertir-digitos
  (lambda (n)
    ; Definir la función "extraer-digitos" usando lambda para obtener los dígitos de "n" en una lista.
    (define extraer-digitos
      (lambda (n)
        ; Evaluar si "n" es menor que 10.
        (if (< n 10)
            ; Retornar una lista que contiene "n" cuando es un dígito único.
            (list n)
            ; Calcular el residuo de "n" al dividirlo entre 10 y almacenarlo en "r"; calcular el cociente y almacenarlo en "q".
            (let ([r (modulo n 10)]
                  [q (quotient n 10)])
              ; Construir la lista de dígitos invirtiendo el orden: colocar "r" al inicio y extraer los dígitos de "q" recursivamente.
              (cons r (extraer-digitos q))))))
    
    ; Almacenar en "lista-digitos" la lista de dígitos extraída de "n".
    (define lista-digitos (extraer-digitos n))
    
    ; Definir la función "convertir-numero" usando lambda para transformar una lista de dígitos en un número.
    (define convertir-numero
      (lambda (l)
        ; Recorrer la lista "l" utilizando foldl para acumular el resultado.
        (foldl (lambda (acc d)
                 ; Multiplicar el acumulador "acc" por 10 y sumar el dígito "d" para formar el nuevo valor.
                 (+ (* acc 10) d))
               0
               l)))
    
    ; Retornar el número obtenido al convertir "lista-digitos" en un número.
    (convertir-numero lista-digitos)))

; Mostrar en la consola el número con dígitos invertidos del número 12345.
(displayln (invertir-digitos 12345))  ; Mostrar 54321.