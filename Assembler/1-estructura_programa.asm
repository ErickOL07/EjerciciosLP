section .data
    msg db  'Primer programa', 0Ah 
    ; db significa "define byte", por lo que se le está diciendo al programa que defina ese dato como un byte y le reserve un espacio en la memoria.
    ; A ese espacio de memoria se le pone nombre y es la variable "msg".
    ; db es una directiva, pues está 

section .text
    global _start
