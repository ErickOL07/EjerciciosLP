#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

/*
7. Escriba un programa que pida al usuario las coordenadas de un punto (x,y)
así como el radio de una circunferencia con centro (0,0). Su programa deberá
determinar si es que el punto se encuentra al interior de la circunferencia, para
esto su punto deberá estar definido como una estructura pudiendo utilizar la
distancia euclideana entre el punto y el centro de la circunferencia. En caso que
la distancia hallada es menor al radio se puede decir que el punto está al
interior de la circunferencia.
Con la finalidad de practicar funciones defina un subprograma con la siguiente
estructura:
double distancia(punto)
el cual devuelva la distancia euclideana de un punto al origen.
*/

typedef struct Punto {
    double X;
    double Y;
} Punto;

double distancia_euclideana (Punto p1, Punto p2) {

    return (double) sqrt(pow((p2.X - p1.X), 2) + pow((p2.Y - p1.Y), 2));

}

bool pertenece(Punto p1, double radio) {

    Punto p2; p2.X = 0; p2.Y = 0;

    return distancia_euclideana(p1, p2) <= radio;

}

int main() {

    Punto p1; double radio;
    printf("Ingrese las coordenadas del punto:\nX: ");
    scanf("%lf", &p1.X);
    printf("Y: ");
    scanf("%lf", &p1.Y);

    printf("\nIngrese el radio de la circunferencia con centro (0,0): ");
    scanf("%lf", &radio);

    printf("\nEl punto (%.2lf,%.2lf) %s a la circunferencia de radio %.2lf con centro (0,0)\n",
           p1.X, p1.Y, pertenece(p1, radio) ? "pertenece" : "NO pertenece", radio);

}
