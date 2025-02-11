PROGRAM suma_numeros
    IMPLICIT NONE
    INTEGER :: i, suma

    ! Inicializamos la suma en 0
    suma = 0

    ! Bucle para sumar del 1 al 5
    DO i = 1, 5
        suma = suma + i
    END DO

    ! Mostrar el resultado
    PRINT *, "La suma es: ", suma
END PROGRAM suma_numeros
