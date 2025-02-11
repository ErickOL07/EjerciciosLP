section .data
    mensaje db 'Cuenta regresiva: ', 0
    ; Declaramos una cadena de texto que contiene un mensaje.
    ; En pseudocódigo sería algo como: `mensaje = "Cuenta regresiva: "`

    digito db 0
    ; Reservamos un byte para almacenar un número.

section .text
    global _start

_start:
    mov ecx, 10
    ; Inicializamos un contador en 10. Este registro será usado para el bucle.
    ; En pseudocódigo: `contador = 10`

bucle:
    mov eax, 4
    ; Configuramos la syscall para escribir (sys_write).

    mov ebx, 1
    ; Configuramos la salida estándar (stdout).

    mov edx, 1
    ; Indicamos que imprimiremos 1 carácter.

    add ecx, '0'
    ; Convertimos el número en el contador a ASCII.
    mov [digito], cl
    ; Guardamos el carácter en la variable `digito`.

    mov ecx, mensaje
    ; Preparamos el mensaje a imprimir (dirección de la cadena).

    mov edx, 17
    ; Longitud del mensaje "Cuenta regresiva: " más el salto de línea.
    int 80h
    ; Llamada al sistema para imprimir el mensaje.

    mov ecx, digito
    ; Cargamos el número convertido en ASCII.

    int 80h
    ; Llamada al sistema para imprimir el número.

    sub ecx, '0'
    ; Convertimos el número ASCII de vuelta a su valor numérico.

    loop bucle
    ; Decrementa el contador (ecx) y salta a la etiqueta "bucle" si es mayor a 0.
    ; En pseudocódigo: `mientras contador > 0:`

    ; Finalización del programa:
    mov eax, 1
    xor ebx, ebx
    int 80h
