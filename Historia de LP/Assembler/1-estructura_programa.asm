section .data
    msg db  'Primer programa', 0Ah 
    ; db significa "define byte", por lo que se le está diciendo al programa que defina ese dato como un byte y le reserve un espacio en la memoria.
    ; A ese espacio de memoria se le pone nombre y es la etiqueta "msg".
    ; db es una directiva, pues da una indicación.
    ; msg es una etiqueta, como una variable, pero en vez de almacenar los datos, asocia la posición de memoria donde se encuentran esos datos con el nombre que se le pone. No almacena nada, solo asocia.

section .text
    global start
    ; global es otra directiva, que indica que la etiqueta "start" será el punto de entrada del programa.
    ; en este caso se declara como global a start, que vendría a ser como un main.

start:
    mov edx, 16
    ; carga el valor "16" en el registro edx y representará el número de caracteres de 'Primer programa' + el salto de línea 0Ah.
    mov ecx, msg
    ; carga la etiqueta "msg" en el registro ecx y representará el mensaje a imprimir.
    mov ebx, 1
    ; carga el valor "1" en el registro ebx y al después poner "int 80h" para hacer una llamada al sistema (syscall), este valor representa la operación que se hará con la llamada al sistema, en este caso un stdout (1).
    mov eax, 4
    ; carga el valor "4" en el registro eax y representa que se hará una sys_write para escribir el mensaje al que apunta msg.
    int 80h
    ; realiza la interrupción de software para ejecutar la llamada al sistema (syscall) configurada en eax.
    ; en este caso, el syscall "sys_write" (4 en eax) usa el descriptor de archivo (1 en ebx) y escribe el mensaje apuntado por ecx con longitud definida en edx.