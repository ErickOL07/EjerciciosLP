; 4. Desarrollar un programa que traduzca el siguiente código en Python a NASM:
; def main():
; a=5
; b=3
; a=a+b
; print(a)

section .data
    suma resb 1
    ; resb significa "reserve byte", lo que le dice al programa que reserve un byte en memoria para almacenar la suma.
    ; A este espacio de memoria se le pone el nombre "suma", y será utilizado para guardar el resultado de la suma.
    ; suma es una etiqueta que apunta a esa posición de memoria reservada.

section .text
    global _start
    ; global es una directiva que indica que la etiqueta "_start" será el punto de entrada del programa.
    ; en este caso, _start será el equivalente a "main" en Python o C.

_start:
    mov eax, 5
    ; carga el valor "5" en el registro eax, representando la variable "a" en Python.
    mov ebx, 3
    ; carga el valor "3" en el registro ebx, representando la variable "b" en Python.
    add eax, ebx
    ; realiza la operación "a + b" sumando el valor de eax (5) con ebx (3), dejando el resultado en eax.
    mov [suma], eax
    ; almacena el resultado de la suma (que está en eax) en la dirección de memoria apuntada por "suma".

    ; Preparar el valor para imprimir:
    add eax, '0'
    ; convierte el valor numérico en un carácter ASCII sumándole el valor de '0'.
    mov [suma], al
    ; guarda el carácter ASCII del resultado en la posición de memoria apuntada por "suma".
    mov ecx, suma
    ; carga la dirección de "suma" en el registro ecx para que pueda ser utilizada como el mensaje a imprimir.
    mov edx, 1
    ; establece la longitud del mensaje a 1 byte, ya que solo queremos imprimir un carácter.
    mov ebx, 1
    ; indica que el descriptor de archivo para la salida estándar (stdout) será usado.
    mov eax, 4
    ; prepara la llamada al sistema para sys_write (escribir en salida estándar).
    int 80h
    ; realiza la llamada al sistema para imprimir el mensaje.

    ; Finalizar el programa:
    mov eax, 1
    ; establece la llamada al sistema para sys_exit (salida del programa).
    xor ebx, ebx
    ; pone el valor de salida en 0, indicando que el programa terminó correctamente.
    int 80h
    ; realiza la interrupción para terminar el programa.
