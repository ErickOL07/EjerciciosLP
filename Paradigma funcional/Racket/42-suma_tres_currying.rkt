; 42. Realizar la suma de tres números usando una función suma que use curry.
; En sí su función debiera permitir hacer algo como lo siguiente:
; funcion(x,y,z)
;    return x+y+z
; pero usando funciones lambda y Currying. Por ejemplo, si ingresa:
; (((curried-sum3 1) 2) 3)
; su programa deberá devolver el valor de 1+2+3, es decir 6.

#lang racket

; Definir la función "curried-sum3" utilizando lambda para recibir el primer número "x".
(define curried-sum3
  (lambda (x)
    ; Recibir el segundo número "y" mediante una función lambda anidada.
    (lambda (y)
      ; Recibir el tercer número "z" mediante otra función lambda anidada.
      (lambda (z)
        ; Sumar los números "x", "y" y "z" y retornar el resultado.
        (+ x y z)))))

; Mostrar en la consola el resultado de la aplicación:
; Aplicar "curried-sum3" a 1 para obtener una función parcial,
; luego aplicarla a 2 para obtener otra función parcial,
; y finalmente aplicarla a 3 para obtener el resultado de la suma.
(displayln (((curried-sum3 1) 2) 3))