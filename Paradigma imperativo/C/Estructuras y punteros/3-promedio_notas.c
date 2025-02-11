#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

/*
3. En base a los datos de la pregunta 1, realice un programa que obtenga el
promedio de las notas del salón de clases.
*/


typedef struct alumno {

    int codigo;
    char nombre[20];
    int nota;

} alumno;

void ordenar(alumno alumnos[], int n) {

    for (int ind = 1; ind < n; ind++) {
        alumno valor = alumnos[ind];
        int i = ind - 1;

        while (i >= 0 && valor.nombre[0] < alumnos[i].nombre[0]) {
            alumnos[i + 1] = alumnos[i];
            i--;
        }
        alumnos[i + 1] = valor;
    }
}

void listaAlumnos(alumno alumnos[], int n) {
    printf("Alumnos ordenados:\n\nCódigo\t| Nombre\t| Nota\n--------+---------------+------");
    for (int i = 0; i < n; i++) {
        printf("\n%d\t| %s\t\t| %d", alumnos[i].codigo, alumnos[i].nombre, alumnos[i].nota);
    }
}

int main() {
    alumno alumnos[] = {
        {1000, "Jorge", 15},
        {1001, "Juan", 16},
        {1002, "Karen", 17},
        {1003, "Ana", 20}
    };

    int n = sizeof(alumnos) / sizeof(alumnos[0]); // sizeof mide bytes

    ordenar(alumnos, n);

    listaAlumnos(alumnos, n);

    int promedio = 0;
    for (int i = 0; i < 4; i++) {

        promedio += alumnos[i].nota;

    }
    promedio /= 4;

    printf("\n\nEl promedio del salón es %d\n", promedio);

    return 0;
}
