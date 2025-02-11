#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

/*
13. Se tiene un arreglo o vector ordenado con los siguientes n�meros:
v[]={10,20,30,40,50,60,70,80,90,100}
Realice una modificaci�n al algoritmo de b�squeda binaria de tal manera que el
recorrido se realice usando arim�tica de punteros.

Algunas recomendaciones:

    a) Cada entero est� separado uno del otro por 4 bytes.

    b) Deber� tener tres punteros, uno que apunte a la izquierda, otro a la derecha
       y uno al medio.

    c) Para obtener la posici�n del medio haga un cast entre los datos a dividir
       entre dos (revisar el algoritmo de b�squeda binaria).

    d) El dato de la parte c) deber� ser convertido a puntero nuevamente por otro
       cast.

    e) En caso la posici�n media no pueda ser divisible exactamente entre 4
       red�zcale dos unidades a este dato.
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

    printf("Ingrese el n�mero a buscar: ");
    scanf("%d", &n);

    printf("\nEl n�mero %d %s encontrado en el vector.\n", n, busqueda_binaria(vector, n) ? "fue" : "no fue");

}
