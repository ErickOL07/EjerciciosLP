#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <math.h>

/*
4. Un punto está compuesto de dos coordenadas X, Y. Hacer un programa
usando una estructura del tipo Punto que permita hallar la distancia
euclideana entre dos puntos definidos por el usuario mediante una función.
*/


typedef struct Punto {

    double X;
    double Y;

} Punto;

double distancia_euclideana (Punto p1, Punto p2) {

    return (double) sqrt(pow((p2.X - p1.X), 2) + pow((p2.Y - p1.Y), 2));

}


int main() {

    Punto p1; Punto p2;
    printf("Ingrese las coordenadas del primer punto:\nX: ");
    scanf("%lf", &p1.X);
    printf("Y: ");
    scanf("%lf", &p1.Y);

    printf("\n\nIngrese las coordenadas del segundo punto:\nX: ");
    scanf("%lf", &p2.X);
    printf("Y: ");
    scanf("%lf", &p2.Y);

    printf("\nLa distancia euclideana entre los puntos (%.2lf,%.2lf) y (%.2lf,%.2lf) es %lf\n", p1.X, p1.Y, p2.X, p2.Y, distancia_euclideana(p1, p2));

}
