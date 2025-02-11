#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

/*
5. Un pixel es un punto que aparte de tener dos coordenadas x,y también posee
un color. Modifique su programa del problema anterior de tal manera que
imprima la distancia entre dos pixels.
Nota: Por facilidad puede considerar que un pixel sólo puede tener tres colores
rojo, verde y azul los cuales pueden estar definidos por variables de tipo
carácter.
*/

typedef struct Color {

    double R;
    double G;
    double B;

} Color;

typedef struct Pixel {

    double X;
    double Y;
    Color color;

} Pixel;

double distancia_euclideana (Pixel p1, Pixel p2) {

    return (double) sqrt(pow((p2.X - p1.X), 2) + pow((p2.Y - p1.Y), 2));

}

Color distancia_color (Pixel p1, Pixel p2) {

    Color c;
    c.R = (double) sqrt(pow((p2.color.R - p1.color.R), 2) + pow((p2.color.R - p1.color.R), 2));
    c.G = (double) sqrt(pow((p2.color.G - p1.color.G), 2) + pow((p2.color.G - p1.color.G), 2));
    c.B = (double) sqrt(pow((p2.color.B - p1.color.B), 2) + pow((p2.color.B - p1.color.B), 2));

    return c;
}

int main() {

    Pixel p1; Pixel p2;
    printf("Ingrese las coordenadas del primer pixel:\nX: ");
    scanf("%lf", &p1.X);
    printf("Y: ");
    scanf("%lf", &p1.Y);
    printf("\nIngrese el color del primer pixel:\nR: ");
    scanf("%lf", &p1.color.R);
    printf("G: ");
    scanf("%lf", &p1.color.G);
    printf("B: ");
    scanf("%lf", &p1.color.B);


    printf("\n\nIngrese las coordenadas del segundo pixel:\nX: ");
    scanf("%lf", &p2.X);
    printf("Y: ");
    scanf("%lf", &p2.Y);
    printf("\nIngrese el color del segundo pixel:\nR: ");
    scanf("%lf", &p2.color.R);
    printf("G: ");
    scanf("%lf", &p2.color.G);
    printf("B: ");
    scanf("%lf", &p2.color.B);

    printf("\nLa distancia euclideana entre los píxeles (%.2lf,%.2lf, {R: %.2lf, G: %.2lf, B: %.2lf}) y (%.2lf,%.2lf, {R: %.2lf, G: %.2lf, B: %.2lf}) es %lf\n", p1.X, p1.Y, p1.color.R, p1.color.G, p1.color.B, p2.X, p2.Y, p2.color.R, p2.color.G, p2.color.B, distancia_euclideana(p1, p2));
    printf("\nEl color entre los píxeles (%.2lf,%.2lf, {R: %.2lf, G: %.2lf, B: %.2lf}) y (%.2lf,%.2lf, {R: %.2lf, G: %.2lf, B: %.2lf}) es {R: %.2lf, G: %.2lf, B: %.2lf}\n", p1.X, p1.Y, p1.color.R, p1.color.G, p1.color.B, p2.X, p2.Y, p2.color.R, p2.color.G, p2.color.B, distancia_color(p1, p2).R, distancia_color(p1, p2).G, distancia_color(p1, p2).B);

}
