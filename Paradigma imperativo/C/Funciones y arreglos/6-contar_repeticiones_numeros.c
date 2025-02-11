#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

// 6. Desarrollar un programa que permita contar cu�ntas veces se repiten los
// n�meros del 0 al 9 cuando estos son generados 100 veces, utilizar arreglos para
// su soluci�n.

int main() {

    srand(time(NULL));
    int array[10] = {0};
    for(int i = 0; i < 100; i++) {
        int numAleatorio = rand() % 10;
        array[numAleatorio]++;
        printf("%d: %d\n", numAleatorio, array[numAleatorio]);
    }

    for(int i = 0; i < 10; i++) {
        printf("N�mero de %d: %d\n", i,array[i]);
    }

    printf("[");
    for(int i = 0; i < 10; i++) {
        if (i != 9) {
            printf("%d, ", array[i]);
        }
        else {
                    printf("%d", array[i]);

        }
    }
        printf("]");

        return 0;

}
