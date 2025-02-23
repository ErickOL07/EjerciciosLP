// Incluimos la biblioteca estándar de entrada y salida para poder imprimir en la consola.
#include <iostream>

// Incluimos la biblioteca estándar de C para funciones de manejo de memoria, aunque en este caso no se usa.
#include <stdlib.h>

// Definimos una clase llamada 'Padre', que será la clase base.
class Padre {
    public:  // Sección pública de la clase, donde se declaran miembros accesibles desde fuera de la clase.
        int a;  // Variable miembro pública de tipo entero.

    // Constructor de la clase 'Padre'.
    Padre(int x) {
        a = x;  // Asignamos el valor del parámetro 'x' a la variable miembro 'a'.
    }

    // Declaramos una función virtual para que pueda ser sobrescrita en clases derivadas.
    virtual void print() {
        std::cout << "Padre var 1 = " << a;  // Imprimimos el valor de 'a'.
        std::cout << std::endl;  // Insertamos un salto de línea.
    }
};

// Definimos una clase 'Hija' que hereda de la clase 'Padre'.
class Hija : public Padre {
    public:
        int c, d;  // Declaramos dos variables miembro públicas de tipo entero.

    // Constructor de la clase 'Hija', que recibe dos parámetros enteros.
    Hija(int x, int y) : Padre(x) {  
        c = x;  // Asignamos el valor de 'x' a la variable 'c'.
        d = y;  // Asignamos el valor de 'y' a la variable 'd'.
    }

    // Sobrescribimos la función 'print' de la clase base 'Padre'.
    virtual void print() override {
        std::cout << "Hija var 1 = " << c << " Hija var 2 = " << d;
        std::cout << std::endl;  // Insertamos un salto de línea.
    }
};

// Definimos una función llamada 'funcA' que recibe un objeto de tipo 'Padre' por valor.
void funcA(Padre obj) {  
    obj.print();  // Llamamos al método 'print' del objeto 'obj'.
}

// Definimos otra función llamada 'funcB' que recibe un objeto de tipo 'Padre' por referencia.
void funcB(Padre &obj) {  
    obj.print();  // Llamamos al método 'print' del objeto 'obj'.
}

// Función principal del programa.
int main() {
    Padre objP(5);  // Creamos un objeto 'objP' de la clase 'Padre' con el valor 5.
    funcA(objP);  // Llamamos a 'funcA' pasando el objeto 'objP' por valor.

    Hija objH(10, 20);  // Creamos un objeto 'objH' de la clase 'Hija' con valores 10 y 20.
    funcA(objH);  // Llamamos a 'funcA' pasando el objeto 'objH' por valor (se produce slicing).
    funcB(objH);  // Llamamos a 'funcB' pasando el objeto 'objH' por referencia.

    return 0;  // Retornamos 0 para indicar que el programa finalizó correctamente.
}
