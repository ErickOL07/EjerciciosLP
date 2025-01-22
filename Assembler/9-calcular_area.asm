section .data
    base db 10
    ; Declaramos la base del rectángulo como 10.
    altura db 5
    ; Declaramos la altura del rectángulo como 5.
    area db 0
    ; Espacio reservado para almacenar el área calculada.

section .text
    global _start

_start:
    ; Cargar la base en AL
    mov al, [base]
    ; Multiplicar AL (base) por la altura (5)
    mov bl, [altura]
    mul bl
    ; Guardar el resultado en la variable "area"
    mov [area], al

    ; Preparar para imprimir el resultado:
    add al, '0'
    ; Convertir el resultado a ASCII.
    mov [area], al
    ; Guardar el carácter en "area".

    ; Imprimir el resultado:
    mov eax, 4
    ; syscall para sys_write.
    mov ebx, 1
    ; salida estándar.
    mov ecx, area
    ; dirección del área (convertida a ASCII).
    mov edx, 1
    ; longitud del carácter.
    int 80h

    ; Finalizar el programa:
    mov eax, 1
    ; syscall para sys_exit.
    xor ebx, ebx
    ; código de salida 0.
    int 80h
