#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

/*
12. Hacer un programa que permita inicializar un vector de 10 elementos con
números al azar comprendidos entre 1 y 10. El programa usando aritmética de
punteros deberá imprimir la sumatoria de los elementos impares de dicho
vector.
*/

int contar (int *vector) {

    int c = 0;
    int *ptr;

    for (ptr = vector; ptr < vector + 10; ptr++) {

        if (*ptr % 2 != 0) {
            c += *ptr;
        }
    }
    return c;

}

int main() {

    srand(time(NULL));

    int vector[10], n, *ptr;

    for (ptr = vector; ptr < vector + 10; ptr++) {

        *ptr = rand() % (10 - 1 + 1) + 1;

    }

    printf("[");
    for (ptr = vector; ptr < vector + 10; ptr++) {
        if (ptr != vector + 9) {
            printf("%d, ", *ptr);
        }
        else {
            printf("%d", *ptr);

        }
    }
    printf("]\n\n");

    printf("\nLa suma de los elementos impares del vector es %d\n", contar(vector));

}
