#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// 10. Escriba un programa en C que permita determinar si un password,
// ingresado por teclado, cumple con las siguientes reglas:
//  � Debe de contener por lo menos 6 caracteres
//  � Debe de tener al menos dos d�gitos
//  � Al menos uno de sus caracteres debe de ser una letra may�scula
// Hint: Seg�n la tabla de c�digos ASCII los caracteres en may�scula ocupan las
// posiciones de la 65 a la 90, las min�sculas de la 97 a la 122, y los n�meros del
// 48 al 57.

int verificar(char *password) {

    int c = 0; int d = 0; int m = 0;
    while (password[c] != '\0' && password[c] != '\n') {
        if (password[c] >= 48 && password[c] <= 57) {
            d++;
        }
        if (password[c] >= 65 && password[c] <= 90) {
            m++;
        }
        c++;
    }
    return (c < 6) || (d < 2) || (m < 1) ? 0 : 1;

}

int main() {

    printf("Crear contrase�a:\n � Debe de contener por lo menos 6 caracteres.\n � Debe de tener al menos dos d�gitos\n � Al menos uno de sus caracteres debe de ser una letra may�scula\n\n\n");

    char password[100];
    do {
        printf("Ingrese una contrase�a: ");
        scanf("%s", password);
        if (!verificar(password)) {
            printf("Contrase�a inv�lida. Vuelva a intentarlo.\n\n\n");
        }
    } while (!verificar(password));

    printf("La contrase�a \"%s\" fue registrada con �xito.", password);
}
