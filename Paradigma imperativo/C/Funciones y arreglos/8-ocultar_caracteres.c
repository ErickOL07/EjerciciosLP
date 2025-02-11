#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

// 8. Escribir una función llamada ocultar que reciba los siguientes parámetros:
// una cadena, un carácter de reemplazo y la posición desde donde se sustituirán
// estos caracteres en la antigua cadena hasta el final. Puede suponer que la
// posición va a ser siempre menor que la cantidad de caracteres de la cadena

int len(const char *cadena) {
    int c = 0;
    while (cadena[c] != '\0') {
        c++;
    }
    return c;
}

void ocultar(char *cadena, char reemplazo, int posicion) {

    int l = len(cadena);

    if (posicion > l) {

        printf("La posición ingresada es mayor a la longitud de la cadena.");

    } else {

        for (int i = (posicion - 1); i < l; i++) {

            cadena[i] = reemplazo;

        }

    }

}

int main() {

    srand(time(NULL));
    char array[10] = {0};
    for(int i = 0; i < 10; i++) {
        int numAleatorio = rand() % 10;
        char str[2];
        sprintf(str, "%d", numAleatorio);
        array[i] = str[0];
    }

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
    printf("Ingrese la posición desde donde se sustituirán los caracteres: ");
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
