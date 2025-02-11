#include <stdio.h>

void imprimir(int *a) {
    int i;
    for (i = 0; i < 4; i++) {
        printf("%d\n", a[i]);
    }
}

int main(void) {
    int i, *p;
    int notas[] = {15, 16, 17, 20};

    i = 10;
    p = &i;

    printf("valor de i %d\n", i);
    printf("valor direccion i %p\n", (void*)&i);
    printf("valor direccion apunta p %p\n", (void*)p);
    printf("valor adonde apunta p %d\n", *p);
    printf("valor direccion p %p\n", (void*)&p);

    *p = 2;
    printf("nuevo valor de i %d\n", i);

    imprimir(notas);

        // ----------------------------- Aritmética de punteros -----------------------------

    printf("\n================= Ejemplos de Aritmética de Punteros =================\n");

    // 1 Recorrer un array usando punteros
    int *ptr = notas; // Apunta al primer elemento del array
    printf("\nEjemplo: Recorrer un array con punteros\n");
    for (int j = 0; j < 4; j++) {
        printf("Elemento %d: %d (Direccion: %p)\n", j, *(ptr + j), (void*)(ptr + j));
    }

    // 2 Uso de p++ para moverse en el array
    ptr = notas; // Reiniciar puntero
    printf("\nEjemplo: Avanzar en un array con punteros (p++)\n");
    for (int j = 0; j < 4; j++) {
        printf("Direccion: %p, Valor: %d\n", (void*)ptr, *ptr);
        ptr++;  // Avanza al siguiente elemento
    }

    // 3 Uso de p-- para retroceder en un array
    ptr--; // Retrocedemos una posición después del loop anterior
    printf("\nEjemplo: Retroceder en un array con punteros (p--)\n");
    for (int j = 0; j < 4; j++) {
        printf("Direccion: %p, Valor: %d\n", (void*)ptr, *ptr);
        ptr--;  // Retrocede al elemento anterior
    }

    // 4️ Diferencia entre dos punteros (p2 - p1)
    int *p1 = &notas[0]; // Apunta al primer elemento
    int *p2 = &notas[3]; // Apunta al último elemento
    printf("\nEjemplo: Calcular la diferencia entre punteros (p2 - p1)\n");
    printf("p1 apunta a %p, p2 apunta a %p\n", (void*)p1, (void*)p2);
    printf("Diferencia en posiciones: %ld\n", p2 - p1);

    // 5 Modificar valores de un array usando punteros
    ptr = notas; // Reiniciar puntero
    printf("\nEjemplo: Modificar valores de un array con punteros\n");
    for (int j = 0; j < 4; j++) {
        *ptr += 5;  // Sumar 5 a cada elemento
        printf("Nuevo valor de notas[%d]: %d\n", j, *ptr);
        ptr++;
    }

    return 0;
}
