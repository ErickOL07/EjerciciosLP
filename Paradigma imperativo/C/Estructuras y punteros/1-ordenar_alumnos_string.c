#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

/*
1. Se tiene un arreglo de estructuras de alumnos con la siguiente información:

Alumno  1           Alumno  2           Alumno  3           Alumno  4
Código: 1000        Código: 1001        Código: 1002        Código: 1003
Nombre: Jorge       Nombre: Juan        Nombre: Karen       Nombre: Ana
Nota:   15          Nota:   16          Nota:   17          Nota:   20

Desarrolle un programa en C que ordene este arreglo de estructuras de forma
ascendente teniendo en cuenta la variable miembro Nombre, para esto
considere sólo la primera letra del nombre.
*/

typedef struct alumno {
    int codigo;
    char nombre[20]; // Se mantiene como array de caracteres
    int nota;
} alumno;

void ordenar(alumno alumnos[], int n) {
    for (int ind = 1; ind < n; ind++) {
        alumno valor = alumnos[ind];
        int i = ind - 1;

        while (i >= 0 && alumnos[i].nombre[0] > valor.nombre[0]) {
            alumnos[i + 1] = alumnos[i];
            i--;
        }
        alumnos[i + 1] = valor;
    }
}

void listaAlumnos(alumno alumnos[], int n) {
    printf("\nAlumnos ordenados:\n\nCódigo\t| Nombre\t| Nota\n--------+---------------+------");
    for (int i = 0; i < n; i++) {
        printf("\n%d\t| %s\t\t| %d", alumnos[i].codigo, alumnos[i].nombre, alumnos[i].nota);
    }
    printf("\n");
}

int main() {
    alumno alumnos[4];
    int n = sizeof(alumnos) / sizeof(alumnos[0]); // Calcula el tamaño del array

    // Entrada de datos desde la consola
    for (int i = 0; i < n; i++) {
        printf("\nIngrese el código del alumno %d: ", i + 1);
        scanf("%d", &alumnos[i].codigo);

        printf("Ingrese el nombre del alumno %d: ", i + 1);
        scanf("%s", alumnos[i].nombre);  // Solo permite un nombre sin espacios

        printf("Ingrese la nota del alumno %d: ", i + 1);
        scanf("%d", &alumnos[i].nota);
    }

    ordenar(alumnos, n);
    listaAlumnos(alumnos, n);

    return 0;
}
