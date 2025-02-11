section .data
    numero db 5
    ; En ensamblador, las variables se declaran en la sección .data y reservan espacio en memoria.
    ; En C, sería equivalente a: `int numero = 5;`

section .text
    global _start
    ; En C, el punto de entrada de un programa es la función `main()`. Aquí, `_start` cumple esa función.

_start:
    mov eax, [numero]
    ; Cargar el valor de la variable "numero" en el registro eax.
    ; En C, sería equivalente a: `int eax = numero;`

    add eax, 3
    ; Sumar 3 al valor almacenado en eax.
    ; En C, sería equivalente a: `eax = eax + 3;`

    mov [numero], eax
    ; Almacenar el nuevo valor de eax de vuelta en la variable "numero".
    ; En C, sería equivalente a: `numero = eax;`

    ; Llamada al sistema para finalizar el programa:
    mov eax, 1
    ; En ensamblador, este valor indica que queremos salir del programa (sys_exit).
    ; En C, sería equivalente a: `return 0;`

    xor ebx, ebx
    ; Poner el código de salida en 0.
    ; En C, esto no es necesario porque `return 0` ya lo incluye implícitamente.

    int 80h
    ; Llamada al sistema para finalizar la ejecución.
    ; En C, el compilador genera automáticamente el código necesario para la salida del programa.
