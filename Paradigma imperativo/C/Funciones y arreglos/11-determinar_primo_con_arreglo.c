#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

// 12. Una manera de determinar si un número n es primo es haciendo uso de un
// array, en dicho array se almacenan los números primos desde 2 hasta sqrt(n).
// En caso de que uno de estos números divida exactamente al número n,
// entonces este ya no sería primo. Por ejemplo:
// n=10
// v[]={2,3} //array de primos desde 2 hasta raíz cuadrada de n
// Como se observa 2 divide exactamente a 10 y por lo tanto no sería un número
// primo.
// Realice un programa que permita determinar si un número es primo haciendo
// uso de un arreglo

bool esPrimo(int n) {

    int v[100]; int p = 0; int c = 0;
    printf("[");
    while (p <= sqrt(n)) {
        int cc = 0;
        for (int i = 0; i <= p; i++) {
            if ((i != 0 && i != 1 && i != p && p % i == 0) || p == 0 || p == 1) {cc++;}
        }
        if (cc == 0) {v[c] = p; c++; printf("%d ,", p);}
        p++;
    }
    printf("]\n");
    for (int i = 0; i < c; i++) {
        if (n % v[i] == 0) {return false;}
    }

    return true;

}

int main() {

    int n;
    printf("Ingrese un número: ");
    scanf("%d", &n);

    if (esPrimo(n)) {
        printf("El número %d es primo.", n);
    } else {
        printf("El número %d no es primo.", n);
    }

}
