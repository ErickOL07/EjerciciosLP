#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

/*
14. Se tiene el siguiente vector:
v[]={10,20,30,40,50,51,60,63,90}
Realizar un programa que mediante punteros recorra este vector e imprima por
pantalla cuántos números divisibles por 3 hay en dicho vector.
*/

int divisibles3(int *vector) {

    int c = 0;
    int *ptr;

    for (ptr = vector; ptr < vector + 30; ptr++) {

        if (*ptr % 3 == 0) {
            c++;
        }
    }
    return c;

}

int main() {

    srand(time(NULL));

    int vector[30], n, *ptr;

    for (ptr = vector; ptr < vector + 30; ptr++) {

        *ptr = rand() % (10 - 1 + 1) + 1;

    }

    printf("[");
    for (ptr = vector; ptr < vector + 30; ptr++) {
        if (ptr != vector + 29) {
            printf("%d, ", *ptr);
        }
        else {
            printf("%d", *ptr);

        }
    }
    printf("]\n\n");

    printf("\nCantidad de elementos divisibles entre 3: %d\n", divisibles3(vector));

}
