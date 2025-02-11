; 5. Desarrolle un algoritmo que permita almacenar los dígitos de un número entre 10 y 99. Almacene
; los dígitos en un arreglo.
; Utilice el algoritmo realizado para imprimir un número de dos dígitos.

section .data
    numero db 57 ; número entre 10 y 99 que se descompondrá (57 en este caso).
    ; db significa "define byte". Aquí se asigna un byte para el número 57.
    ; A la etiqueta "numero" se le asocia la posición de memoria que contiene el valor 57.
    digitos db 2 dup(0)
    ; Aquí se reserva un arreglo para almacenar dos dígitos.
    ; La directiva "dup" permite duplicar un valor inicial (en este caso, 0) tantas veces como sea indicado (2 veces para los dos dígitos).

section .text
    global _start
    ; La directiva "global" define que "_start" será el punto de entrada del programa.

_start:
    ; Cargar el número en el registro eax:
    mov al, [numero]
    ; Carga el valor almacenado en la etiqueta "numero" (57) en el registro AL.

    ; Obtener el primer dígito (decenas):
    mov bl, 10
    ; Carga el valor 10 en el registro BL, que será usado para dividir.
    div bl
    ; Divide el contenido de AL (57) entre BL (10). El cociente queda en AL y el residuo en AH.
    mov [digitos], al
    ; Guarda el cociente (decenas) en la primera posición del arreglo "digitos".

    ; Obtener el segundo dígito (unidades):
    mov [digitos+1], ah
    ; Guarda el residuo (unidades) en la segunda posición del arreglo "digitos".

    ; Convertir los dígitos a caracteres ASCII para imprimir:
    add byte [digitos], '0'
    ; Convierte el primer dígito a su valor ASCII sumándole el valor de '0'.
    add byte [digitos+1], '0'
    ; Convierte el segundo dígito a su valor ASCII sumándole el valor de '0'.

    ; Imprimir el primer dígito:
    mov eax, 4
    ; Configura el syscall para sys_write (escribir en la salida estándar).
    mov ebx, 1
    ; Configura la salida estándar (stdout).
    mov ecx, digitos
    ; Apunta al primer dígito en el arreglo "digitos".
    mov edx, 1
    ; Indica que se imprimirá un byte (un carácter).
    int 80h
    ; Realiza la llamada al sistema para imprimir el carácter.

    ; Imprimir el segundo dígito:
    mov eax, 4
    mov ebx, 1
    mov ecx, digitos+1
    ; Apunta al segundo dígito en el arreglo "digitos".
    mov edx, 1
    int 80h

    ; Finalizar el programa:
    mov eax, 1
    ; Configura el syscall para sys_exit (salida del programa).
    xor ebx, ebx
    ; Establece el código de salida en 0 (sin errores).
    int 80h
    ; Realiza la interrupción para terminar el programa.
