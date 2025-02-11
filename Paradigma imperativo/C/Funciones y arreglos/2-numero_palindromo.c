#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// 2. Un n�mero es pal�ndromo si es que al ser le�do de izquierda a derecha es
// igual a leerlo de derecha a izquierda. Por ejemplo: 1221 es pal�ndromo y 1234
// no es pal�ndromo. Desarrollar un programa que usando funciones determine si
// un n�mero es pal�ndromo o no.
// Nota: Puede crear una funci�n de ayuda que mediante operaciones aritm�ticas
// retorne un n�mero n de forma inversa. Es decir, si se ingresa 123 la funci�n
// retornar� 321.

int invertir(int num) {

    int n = 0;
    while (num > 0) {
        n = (n*10 + num%10);
        num = (num - num%10)/10;
    }
    return n;
}

bool esPalindromo(int num) {

    return (invertir(num) == num);

}

int main() {

    int n;
    printf("Ingrese un n�mero: ");
    scanf("%d", &n);

    if (esPalindromo(n)) {
        printf("El n�mero %d es pal�ndromo.", n);
    } else {
        printf("El n�mero %d no es pal�ndromo.", n);
    }

}
