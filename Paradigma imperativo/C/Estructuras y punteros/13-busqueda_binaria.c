#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

/*
13. Se tiene un arreglo o vector ordenado con los siguientes números:
v[]={10,20,30,40,50,60,70,80,90,100}
Realice una modificación al algoritmo de búsqueda binaria de tal manera que el
recorrido se realice usando arimética de punteros.

Algunas recomendaciones:

    a) Cada entero está separado uno del otro por 4 bytes.

    b) Deberá tener tres punteros, uno que apunte a la izquierda, otro a la derecha
       y uno al medio.

    c) Para obtener la posición del medio haga un cast entre los datos a dividir
       entre dos (revisar el algoritmo de búsqueda binaria).

    d) El dato de la parte c) deberá ser convertido a puntero nuevamente por otro
       cast.

    e) En caso la posición media no pueda ser divisible exactamente entre 4
       redúzcale dos unidades a este dato.
*/

bool busqueda_binaria(int *vector, int n) {

    int *izquierda = vector;
    int *derecha = vector + 9;
    int *medio;

    while (izquierda <= derecha) {

        medio = (int *)(((char *)izquierda + (char *)derecha) / 2);

        if ((long)medio % sizeof(int) != 0) {
            medio = (int *)((char *)medio - 2);
        }

        if (*medio == n) {
            return true;
        }
        if (*medio < n) {
            izquierda = medio + 1;
        }
        else {
            derecha = medio - 1;
        }
    }

    return false;
}

int main() {

    int vector[] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
    int n;

    printf("[");
    for (int *ptr = vector; ptr < vector + 10; ptr++) {
        if (ptr != vector + 9) {
            printf("%d, ", *ptr);
        }
        else {
            printf("%d", *ptr);
        }
    }
    printf("]\n\n");

    printf("Ingrese el número a buscar: ");
    scanf("%d", &n);

    printf("\nEl número %d %s encontrado en el vector.\n", n, busqueda_binaria(vector, n) ? "fue" : "no fue");

}
