section .data
    numeros db '1', '2', '3', 0Ah, '4', '5', '6', 0Ah, '7', '8', '9', 0Ah, '10', 0Ah
    ; Declaramos los números como caracteres ASCII, organizados en filas con saltos de línea (0Ah).

section .text
    global _start

_start:
    ; Imprimir todos los números en la matriz:
    mov eax, 4
    ; syscall para sys_write
    mov ebx, 1
    ; salida estándar (stdout)
    mov ecx, numeros
    ; dirección de la cadena de números
    mov edx, 16
    ; longitud de la cadena incluyendo los saltos de línea
    int 80h

    ; Finalizar el programa:
    mov eax, 1
    ; syscall para sys_exit
    xor ebx, ebx
    ; código de salida 0
    int 80h
