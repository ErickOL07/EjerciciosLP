#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

/*
9. Se tiene un vector de n elementos, estos elementos deben de ser llenados al
principio por números al azar. Posteriormente llame a una función llamada
inicializar(), la cual recibe como argumento al vector, un valor m (que debe de
ser menor que n) y un valor p. Lo que hace esta función es colocar un cierto
número de ceros (m), empezando desde la primera posición y luego saltando p
valores. Ejemplo:
v[]={10,20,30,40,50,60,70,80,90,100}
inicializar(v,4,3);
imprimirá:
0,20,30,0,50,60,0,80,90,0
Utilice punteros y aritmética de punteros.

Nota: En caso la cantidad de ceros (m) o los saltos (p) excedan la longitud del
vector tan sólo se llenará esta estructura hasta donde sea posible
*/

int len(int *vector) {
    int c = 0;

    while (vector[c] != -1000) {
        c++;
    }
    return c;
}

void inicializar (int *vector, int m, int p) {

    int c = p;
    for (int i = 0; i < len(vector); i++) {

        if (c == p && m > 0) {

            vector[i] = 0;
            m--;
            c = 0;

        }

        c++;
    }

}


int main() {

    srand(time(NULL));

    int n, m, p;

    printf("Ingrese el número de elementos: ");
    scanf("%d", &n);

    int vector[n + 1];

    for(int i = 0; i < n; i++) {

        vector[i] = rand() % (100 - 1 + 1) + 1;

    }

    vector[n] = -1000;

    printf("[");
    for(int i = 0; i < n; i++) {
        if (i != n - 1) {
            printf("%d, ", vector[i]);
        }
        else {
            printf("%d", vector[i]);

        }
    }
    printf("]\n");

    do {
        printf("\nIngrese el valor de m: ");
        scanf("%d", &m);
    } while (m > n);
    printf("Ingrese el valor de p: ");
    scanf("%d", &p);

    inicializar(vector, m, p);

    printf("\n\n[");
    for(int i = 0; i < n; i++) {
        if (i != n - 1) {
            printf("%d, ", vector[i]);
        }
        else {
            printf("%d", vector[i]);

        }
    }
    printf("]\n");

}
