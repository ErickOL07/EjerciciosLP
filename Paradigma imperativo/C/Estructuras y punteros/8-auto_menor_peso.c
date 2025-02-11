#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <string.h>
#include <limits.h>

/*
8. Crear un array de estructuras del tipo auto, cada auto tiene un código y un
peso. Ambos datos son generados al azar. El código está en el rango del 1 al 10
y el peso en el rango de 1000 a 3000. Realizar un programa que permita
almacenar en un arreglo llamado tienda 10 vehículos. El programa deberá
imprimir el código y el peso del auto con menor peso.
*/

typedef struct Auto {
    char codigo[11];
    double peso;
} Auto;

Auto menorPeso (Auto autos[], int n) {

    Auto a; a.peso = INT_MAX;

    for (int i = 0; i < n; i++) {

        if (autos[i].peso < a.peso) {

            strcpy(a.codigo, autos[i].codigo);
            a.peso = autos[i].peso;

        }

    }

    return a;

}

int main() {

    srand(time(NULL));

    int n; int max = 0;

    printf("Ingrese el número de autos: ");
    scanf("%d", &n);
    Auto autos[n];

    for (int i = 0; i < n; i++) {

        for (int j = 0; j < 10; j++) {

            if (rand() % 2 == 0) {
                autos[i].codigo[j] = rand() % (90 - 65 + 1) + 65; // letras mayus
            } else {
                autos[i].codigo[j] = rand() % (57 - 48 + 1) + 48; // números
            }

        }

        autos[i].codigo[10] = '\0';

        /*
        double min = 1.0, max = 100.0;
        double random_double = min + (rand() / (double)RAND_MAX) * (max - min);
        */

        autos[i].peso = 1000 + (rand() / (double)RAND_MAX) * (3000 - 1000);

        printf("\nAuto %d:\n - Código: %s\n - Peso: %.2lf Kg\n", i + 1, autos[i].codigo, autos[i].peso);

    }

    printf("\n\nEl auto con el menor peso es:\n - Código: %s\n - Peso: %.2lf Kg", menorPeso(autos, n).codigo, menorPeso(autos, n).peso);

}
