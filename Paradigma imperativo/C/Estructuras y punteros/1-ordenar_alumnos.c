#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <string.h>

/*
1. Se tiene un arreglo de estructuras de alumnos con la siguiente informaci�n:

Alumno  1           Alumno  2           Alumno  3           Alumno  4
C�digo: 1000        C�digo: 1001        C�digo: 1002        C�digo: 1003
Nombre: Jorge       Nombre: Juan        Nombre: Karen       Nombre: Ana
Nota:   15          Nota:   16          Nota:   17          Nota:   20

Desarrolle un programa en C que ordene este arreglo de estructuras de forma
ascendente teniendo en cuenta la variable miembro Nombre, para esto
considere s�lo la primera letra del nombre.
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
    printf("Alumnos ordenados:\n\nC�digo\t| Nombre\t| Nota\n--------+---------------+------");
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

    return 0;
}
