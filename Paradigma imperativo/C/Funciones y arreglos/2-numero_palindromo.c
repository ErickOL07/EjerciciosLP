#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// 2. Un número es palíndromo si es que al ser leído de izquierda a derecha es
// igual a leerlo de derecha a izquierda. Por ejemplo: 1221 es palíndromo y 1234
// no es palíndromo. Desarrollar un programa que usando funciones determine si
// un número es palíndromo o no.
// Nota: Puede crear una función de ayuda que mediante operaciones aritméticas
// retorne un número n de forma inversa. Es decir, si se ingresa 123 la función
// retornará 321.

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
    printf("Ingrese un número: ");
    scanf("%d", &n);

    if (esPalindromo(n)) {
        printf("El número %d es palíndromo.", n);
    } else {
        printf("El número %d no es palíndromo.", n);
    }

}
