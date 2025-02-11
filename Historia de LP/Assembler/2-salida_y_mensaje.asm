section .data
    msg db  'Primer programa', 0Ah 

section .text
    global start

start:
    mov edx, 16
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 80h

    ; a) Mueva 0 al registro ebx. Este paso indica un código de salida o que el programa no presenta errores.
    mov ebx, 0
    ; determina que el programa se termina con éxito cuando se llame al eax 1.

    ; b) Mueva el valor de 1 al registro eax para indicar la salida del sistema al kernel.
    mov eax, 1
    ; llama al sys_exit para terminar el programa.

    ; c) Hacer una llamada al sistema con la interrupción 80h.
    int 80h
    ; realiza la interrupción para hacer el syscall de ebx 0 y eax 1.