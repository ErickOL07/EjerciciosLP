#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <limits.h>

// 7. Desarrollar un programa que solicite al usuario una cantidad n de alumnos a
// los cuales se les solicita sus nombres y notas. El programa deber� imprimir cu�l
// es aquel alumno que tiene la nota m�s alta. Para su soluci�n no deber�
// almacenar los datos en un arreglo de alumnos.

int main() {

    int n; int c = 1; int minN = INT_MAX; char minA[100]; int maxN = 0; char maxA[100];

    printf("Ingrese el n�mero de alumnos: ");
    scanf("%d", &n);

    while (c <= n) {

        c++;
        char a[100]; int b;

        printf("\nIngrese el nombre del alumno: ");
        scanf("%s", a);

        do {
            printf("\nIngrese la nota: ");
            scanf("%d", &b);
        } while (b < 0 || b > 20);

        if (b > maxN) {

            maxN = b;
            strcpy(maxA, a);

        }
        if (b < minN) {

            minN = b;
            strcpy(minA, a);

        }

    }

    printf("\n\n\nAlumno con la nota m�s alta:\n - Nombre: %s\n - Nota: %d\n\nAlumno con la nota m�s baja:\n - Nombre: %s\n - Nota: %d\n", maxA, maxN, minA, minN);

    return 0;
}
