; 3. Simular una operación del tipo len(x), el cual devuelva el número de caracteres a imprimir.

section .data
    msg db  'Hola', 0Ah 
    len_msg equ $ - msg
    ; hago que la etiqueta len_msg sea igual al valor del número de bytes de $ (byte actual) - msg (byte donde empieza msg).
    ; len_msg ahora es una constante simbólica.

section .bss
    len_res resb 1
    ; reservo un caracter para imprimir la longitud del mensaje.

section .text
    global _start

_start:
    mov edx, len_msg
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 80h

    mov eax, len_msg
    ; almaceno temporalmente el valor de la longitud del mensaje en el registro eax.

    add eax, '0'
    ; le sumo el equivalente numérico del 0 en ASCII a la longitud del mensaje, o sea 48, pues a partir de ese valor se representan los números en ASCII, entonces, si el "0" es 48, el 5, por ejemplo, será 48+5, por eso se suma.
    ; también funciona al poner "add eax, 48"

    mov [len_res], eax
    ; para poder usar el valor asignado en eax al hacer el syscall, se almacena temporalmente en len_res.

    mov edx, 1
    ; con el registro edx indico la cantidad de caracteres a imprimir.

    mov ecx, len_res
    ; con el registro ecx indico el mensaje a imprimir.

    mov ebx, 1
    ; sdout

    mov eax, 4
    ; sys_write

    int 80h
    ; syscall

    mov ebx, 0
    mov eax, 1
    int 80h