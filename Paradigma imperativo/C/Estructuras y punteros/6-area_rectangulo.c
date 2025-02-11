#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

/*
6. Suponga que tiene dos estructuras, una denominada punto como la
estructura de la pregunta 4 y una estructura denominada rectángulo de la
siguiente forma:
    Rectángulo:
     - Punto esquinaSupIzquierda
     - Punto esquinaInfDerecha
Considerando estas dos estructuras elabore un programa que contenga una
función que reciba una estructura del tipo rectángulo y que devuelva su área.

*/

typedef struct Punto {
    double X;
    double Y;
} Punto;

typedef struct Rectangulo {
    Punto punto[4];
    double base;
    double altura;
} Rectangulo;

double areaRectangulo(Rectangulo *rectangulo) {
    rectangulo->base = abs(rectangulo->punto[2].X - rectangulo->punto[0].X);
    rectangulo->altura = abs(rectangulo->punto[2].Y - rectangulo->punto[0].Y);
    return rectangulo->base * rectangulo->altura;
}

void calcularVertices(Rectangulo *rectangulo) {
    double x1 = rectangulo->punto[0].X;
    double y1 = rectangulo->punto[0].Y;
    double x2 = rectangulo->punto[2].X;
    double y2 = rectangulo->punto[2].Y;

    rectangulo->punto[1].X = x2;
    rectangulo->punto[1].Y = y1;

    rectangulo->punto[3].X = x1;
    rectangulo->punto[3].Y = y2;
}

int main() {
    Rectangulo rectangulo;

    printf("Ingrese las coordenadas de un punto del rectángulo (X Y): ");
    scanf("%lf %lf", &rectangulo.punto[0].X, &rectangulo.punto[0].Y);

    printf("Ingrese las coordenadas del punto opuesto (X Y): ");
    scanf("%lf %lf", &rectangulo.punto[2].X, &rectangulo.punto[2].Y);

    calcularVertices(&rectangulo);

    double area = areaRectangulo(&rectangulo);

    printf("\nBase: %.2lf, Altura: %.2lf\n", rectangulo.base, rectangulo.altura);
    printf("El área del rectángulo es: %.2lf\n", area);
    printf("\nVértices del rectángulo:\n");
    printf(" - P1 (%.2lf, %.2lf)\n", rectangulo.punto[0].X, rectangulo.punto[0].Y);
    printf(" - P2 (%.2lf, %.2lf)\n", rectangulo.punto[1].X, rectangulo.punto[1].Y);
    printf(" - P3 (%.2lf, %.2lf)\n", rectangulo.punto[2].X, rectangulo.punto[2].Y);
    printf(" - P4 (%.2lf, %.2lf)\n", rectangulo.punto[3].X, rectangulo.punto[3].Y);

    return 0;
}
