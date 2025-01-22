section .data
    suma db 0
    ; Reservamos un byte para almacenar la suma.

section .text
    global _start

_start:
    mov ecx, 5
    ; Inicializamos un contador en 5 (número de iteraciones).

    xor eax, eax
    ; Inicializamos eax en 0 para usarlo como acumulador.

bucle:
    add eax, ecx
    ; Sumamos el valor de ecx al acumulador eax.
    loop bucle
    ; Decrementa ecx y salta al bucle mientras ecx > 0.

    mov [suma], al
    ; Guardamos el resultado de la suma en la variable "suma".

    ; Convertir el resultado a ASCII:
    add al, '0'
    ; Convertimos el resultado numérico en un carácter ASCII.

    ; Imprimir el resultado:
    mov eax, 4
    ; syscall para sys_write.
    mov ebx, 1
    ; salida estándar.
    mov ecx, suma
    ; dirección del resultado convertido a ASCII.
    mov edx, 1
    ; longitud del carácter.
    int 80h

    ; Finalizar el programa:
    mov eax, 1
    ; syscall para sys_exit.
    xor ebx, ebx
    ; código de salida 0.
    int 80h
