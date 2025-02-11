#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

/*
2. Se tiene una estructura llamada fracción, esta contiene dos datos de tipo
entero: numerador y denominador. Llene un arreglo de 10 fracciones donde
los valores del numerador deberán ser números impares y los del denominador
números pares entre 1 y 10, generados al azar.

Se deben programar las funciones:
- sumar_fracciones(fraccion1, fraccion2)
- restar_fracciones(fraccion1, fraccion2)
- dividir_fracciones(fraccion1, fraccion2)
*/

typedef struct Fraccion {

    int numerador;
    int denominador;

} Fraccion;

Fraccion sumar_fracciones(Fraccion f1, Fraccion f2) {

    Fraccion r;
    if (f1.denominador == f2.denominador) {
        r.numerador = (f1.numerador + f2.numerador);
        r.denominador = f1.denominador;
    } else {
        r.numerador = (f1.numerador*f2.denominador + f2.numerador*f1.numerador);
        r.denominador = (f1.denominador*f2.denominador);
    }

    return r;

}

Fraccion restar_fracciones(Fraccion f1, Fraccion f2) {

    Fraccion r;
    if (f1.denominador == f2.denominador) {
        r.numerador = (f1.numerador - f2.numerador);
        r.denominador = f1.denominador;
    } else {
        r.numerador = (f1.numerador*f2.denominador - f2.numerador*f1.numerador);
        r.denominador = (f1.denominador*f2.denominador);
    }

    return r;

}

Fraccion dividir_fracciones(Fraccion f1, Fraccion f2) {

    Fraccion r;
    r.numerador = f1.numerador*f2.denominador;
    r.denominador = f2.numerador*f1.denominador;
    return r;

}

int impar (int de, int hasta) {

    int n;
    do {
        n = rand() % (hasta - de + 1) + de;
    } while (n % 2 == 0);

    return n;

}

int par (int de, int hasta) {

    int n;
    do {
        n = rand() % (hasta - de + 1) + de;
    } while (n % 2 != 0);

    return n;

}

int main() {

    Fraccion fracciones[10]; Fraccion suma; Fraccion resta; Fraccion division;

    for (int i = 0; i < 10; i++) {

        Fraccion f;
        f.numerador = impar(1, 10);
        f.denominador = par(1,10);
        fracciones[i] = f;

    }

    Fraccion s1; Fraccion s2;
    s1 = fracciones[rand() % 10]; s2 = fracciones[rand() % 10];
    suma = sumar_fracciones(s1, s2);

    Fraccion r1; Fraccion r2;
    r1 = fracciones[rand() % 10]; r2 = fracciones[rand() % 10];
    resta = restar_fracciones(r1, r2);

    Fraccion d1; Fraccion d2;
    d1 = fracciones[rand() % 10]; d2 = fracciones[rand() % 10];
    division = dividir_fracciones(d1, d2);

    printf("[");
    for(int i = 0; i < 10; i++) {
        if (i != 9) {
            printf("%d/%d, ", fracciones[i].numerador, fracciones[i].denominador);
        }
        else {
            printf("%d/%d", fracciones[i].numerador, fracciones[i].denominador);

        }
    }
    printf("]\n");

    printf("%d/%d + %d/%d = %d/%d\n", s1.numerador, s1.denominador, s2.numerador, s2.denominador, suma.numerador, suma.denominador);
    printf("%d/%d - %d/%d = %d/%d\n", r1.numerador, r1.denominador, r2.numerador, r2.denominador, resta.numerador, resta.denominador);
    printf("%d/%d / %d/%d = %d/%d", d1.numerador, d1.denominador, d2.numerador, d2.denominador, division.numerador, division.denominador);

}
