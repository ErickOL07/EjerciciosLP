#include <stdio.h>
#include <stdlib.h>

// 3. Desarrolle una funci�n que retorne 1 si un n�mero n es primo y que devuelva
// 0 en caso contrario.

int esPrimo(int num) {

    if (num <= 1) return 0;
    if (num == 2) return 1;
    for(int i = 2; i < num; i++) {

        if (num%i == 0) {
            return 0;
        }

    }
    return 1;

}

int main() {

    int n;
    printf("Ingrese un n�mero: ");
    scanf("%d", &n);

    if (esPrimo(n)) {
        printf("El n�mero %d es primo.", n);
    } else {
        printf("El n�mero %d no es primo.", n);
    }

}
