#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// 9. Cree una función adicional en el programa de la pregunta 8 la cual sustituya
// una cantidad x de caracteres por un carácter c empezando desde el final, realice
// una validación en caso la cantidad de caracteres ingresados sea mayor a la
// longitud de la cadena.

int len(const char *cadena) {
    int c = 0;
    while (cadena[c] != '\0') {
        c++;
    }
    return c;
}

void ocultar(char *cadena, char reemplazo, int cantidad) {

    int l = len(cadena);

    if (cantidad > l) {

        printf("La cantidad ingresada es mayor a la longitud de la cadena.");

    } else {

        for (int i = 0; i < cantidad + 1; i++) {

            cadena[l - i] = reemplazo;

        }

    }

}

int main() {

    srand(time(NULL));
    char array[11] = {0};
    for(int i = 0; i < 10; i++) {
        int numAleatorio = rand() % 10;
        char str[2];
        sprintf(str, "%d", numAleatorio);
        array[i] = str[0];
    }
    array[10] = '\0';

    printf("[");
    for(int i = 0; i < 10; i++) {
        if (i != 9) {
            printf("%c, ", array[i]);
        }
        else {
            printf("%c", array[i]);

        }
    }
    printf("]");

    char chr;
    printf("\n\nIngrese el caracter con el que se va a ocultar: ");
    chr = getchar();

    int n;
    printf("Ingrese la cantidad de caracteres a ocultar: ");
    scanf("%d", &n);

    ocultar(array, chr, n);

    printf("\n[");
    for(int i = 0; i < 10; i++) {
        if (i != 9) {
            printf("%c, ", array[i]);
        }
        else {
            printf("%c", array[i]);

        }
    }
    printf("]");

        return 0;

}
