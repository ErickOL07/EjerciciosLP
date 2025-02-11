#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// 5. Un emirp es un número primo que no es palíndromo, pero que su reversa sí
// lo es. Por ejemplo, el 17 es primo y el 71 también; por tanto, el 17 y el 71 son
// emirps. Escriba un programa que visualice los primeros 100 emirps.


int invertir(int num) {

    int n = 0;
    while (num > 0) {
        n = (n*10 + num%10);
        num = (num - num%10)/10;
    }
    return n;
}

bool esPrimo(int num) {

    if (num <= 1) return false;
    if (num == 2) return true;
    for(int i = 2; i < num; i++) {

        if (num%i == 0) {
            return false;
        }

    }
    return true;

}

bool esEmirp(int num) {

    return (esPrimo(num) && esPrimo(invertir(num)) && num != invertir(num));

}

int main() {

    int c = 0; int n = 0;
    while (c <= 100) {

        if (esEmirp(n)) {

            c++;
            printf("%d y %d\n", n, invertir(n));
        }
            n++;

    }

}
