#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// 4. Un n�mero primo pal�ndromo es aquel que cumple ambas caracter�sticas, por
// ejemplo, el 131 es un n�mero primo y que tambi�n es pal�ndromo. Escriba un
// programa que permita visualizar los 100 primeros n�meros primos pal�ndromos

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

int main() {

    int c = 0; int n = 0;
    while (c <= 100) {

        if (esPrimo(n) && esPalindromo(n)) {

            c++;
            printf("%d\n", n);
        }
            n++;

    }

}
