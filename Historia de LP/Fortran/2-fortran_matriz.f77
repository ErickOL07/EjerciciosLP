PROGRAM imprimir_matriz
    IMPLICIT NONE
    INTEGER :: i, j
    CHARACTER(2) :: numero

    ! Imprimir los números en formato matriz
    DO i = 1, 3
        DO j = 1, 3
            WRITE(numero, '(I1)') (i-1)*3 + j
            WRITE(*, "(A)", ADVANCE='NO') TRIM(ADJUSTL(numero)) // " "
        END DO
        PRINT *, "" ! Salto de línea al final de cada fila
    END DO

    ! Imprimir el número 10 en una línea separada
    PRINT *, "10"
END PROGRAM imprimir_matriz
