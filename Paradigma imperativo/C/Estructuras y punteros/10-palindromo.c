#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

/*
10. Realizar un programa que permita determinar si una cadena ingresada por
teclado es un palíndromo. Por ejemplo:
MADAM es un palíndromo
Utilice punteros y aritmética de punteros para determinar si la palabra es
palíndromo o no. Aparte el programa no deberá hacer caso cuando se hayan
insertado números en la palabra, por ejemplo si se ingresa:
MA5D8AM, esta palabra eliminando los números seguirá siendo un
palíndromo.
Hint: Recuerde que según la tabla de códigos ASCII los números tienen los
códigos 48 al 57.
*/

int len(const char *cadena) {
    const char *ptr = cadena;
    while (*ptr != '\0') {
        ptr++;
    }
    return ptr - cadena;
}

bool esPalindromo(char *cadena) {

    char *leer = cadena, *escribir = cadena;
    while (*leer) {
        if (!(*leer >= '0' && *leer <= '9')) {
            *escribir = *leer;
            escribir++;
        }
        leer++;
    }
    *escribir = '\0';

    char *inicio = cadena;
    char *fin = cadena + len(cadena) - 1;

    while (inicio < fin) {
        if (*inicio != *fin) {
            return false;
        }
        inicio++;
        fin--;
    }

    return true;
}

int main() {

    char cadena[100];
    printf("Ingrese un texto: ");
    scanf("%s", cadena);

    if (esPalindromo(cadena)) {
        printf("La cadena %s es palíndroma.", cadena);
    } else {
        printf("La cadena %s no es palíndroma.", cadena);
    }

    printf("\n[");

    printf("\nCadena limpia: [");
    for (char *ptr = cadena; *ptr; ptr++) {
        printf("%c", *ptr);
    }
    printf("]\n");

    return 0;

}
