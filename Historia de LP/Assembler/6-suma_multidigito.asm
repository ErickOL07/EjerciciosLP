section .data
    num1 db 57 ; primer número (57).
    num2 db 38 ; segundo número (38).
    resultado db 0 ; para almacenar el resultado de la suma.
    digitos db 4 dup(0)
    ; reservamos un arreglo para almacenar hasta 4 dígitos (2 del resultado y 2 espacios vacíos).

section .text
    global _start
    ; define el punto de entrada del programa.

_start:
    ; Cargar los números y sumarlos:
    mov al, [num1]
    ; carga el primer número (57) en AL.
    add al, [num2]
    ; suma el segundo número (38) al contenido de AL.
    mov [resultado], al
    ; almacena el resultado en la etiqueta "resultado".

    ; Descomponer el resultado en sus dígitos:
    mov al, [resultado]
    mov bl, 10
    div bl
    ; divide el resultado por 10. El cociente (decenas) queda en AL y el residuo (unidades) en AH.

    ; Guardar los dígitos en el arreglo:
    mov [digitos], al
    ; almacena el dígito de las decenas en la primera posición.
    mov [digitos+1], ah
    ; almacena el dígito de las unidades en la segunda posición.

    ; Convertir los dígitos a ASCII para imprimir:
    add byte [digitos], '0'
    ; convierte el primer dígito a su carácter ASCII.
    add byte [digitos+1], '0'
    ; convierte el segundo dígito a su carácter ASCII.

    ; Imprimir el primer dígito (decenas):
    mov eax, 4
    ; syscall para sys_write.
    mov ebx, 1
    ; salida estándar.
    mov ecx, digitos
    ; dirección del primer dígito.
    mov edx, 1
    ; longitud del mensaje.
    int 80h
    ; realiza la llamada al sistema.

    ; Imprimir el segundo dígito (unidades):
    mov eax, 4
    mov ebx, 1
    mov ecx, digitos+1
    ; dirección del segundo dígito.
    mov edx, 1
    int 80h

    ; Finalizar el programa:
    mov eax, 1
    ; syscall para sys_exit.
    xor ebx, ebx
    ; código de salida 0.
    int 80h
