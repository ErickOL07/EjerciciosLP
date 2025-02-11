; 44. Utilice un esquema parecido al utilizado en la pregunta de la sumatoria de
; tres números enteros a fin de hacer un programa que concatene tres cadenas
; usando Currying. Puede usar la función string-append como el siguiente
; ejemplo: (string-append "Apple" "Banana") para concatenar sus cadenas

#lang racket

; Definir la función "curried-concat3" usando lambda.
; Recibir como primer argumento la cadena "str1".
(define curried-concat3
  (lambda (str1)
    ; Recibir como segundo argumento la cadena "str2".
    (lambda (str2)
      ; Recibir como tercer argumento la cadena "str3".
      (lambda (str3)
        ; Concatenar "str1", "str2" y "str3" utilizando string-append y retornar el resultado.
        (string-append str1 str2 str3)))))

; Mostrar en la consola el resultado de concatenar tres cadenas.
; Aplicar la función "curried-concat3" de forma secuencial:
; 1. Aplicar "Apple" para obtener una función parcial.
; 2. Aplicar " Banana" a la función parcial.
; 3. Aplicar " Pie" para obtener la cadena concatenada completa.
(displayln (((curried-concat3 "Apple") " Banana") " Pie"))