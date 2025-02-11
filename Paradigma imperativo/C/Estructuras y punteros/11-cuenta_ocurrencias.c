#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

/*
11. Realice un programa que inicialice un vector de 20 elementos de números al
azar comprendidos entre 1 y 20, su programa mediante una función con la
siguiente estructura:
int cuentaOcurrencias(int* v)
deberá imprimir cuantas veces aparece un número n ingresado por el usuario.
Para su solución utilice aritmética de punteros.
*/

int cuentaOcurrencias(int *vector, int n) {

    int c = 0;
    int *ptr;

    for (ptr = vector; ptr < vector + 20; ptr++) {
        if (*ptr == n) {
            c++;
        }
    }
    return c;

}

int main() {

    srand(time(NULL));

    int vector[20], n, *ptr;

    for (ptr = vector; ptr < vector + 20; ptr++) {

        *ptr = rand() % (10 - 1 + 1) + 1;

    }

    printf("[");
    for (ptr = vector; ptr < vector + 20; ptr++) {
        if (ptr != vector + 19) {
            printf("%d, ", *ptr);
        }
        else {
            printf("%d", *ptr);

        }
    }
    printf("]\n\n");

    printf("Ingrese el número para contar: ");
    scanf("%d", &n);

    printf("\nEl número %d aparece %d ve%s\n", n, cuentaOcurrencias(vector, n), cuentaOcurrencias(vector, n) != 1 ? "ces." : "z.");

}
