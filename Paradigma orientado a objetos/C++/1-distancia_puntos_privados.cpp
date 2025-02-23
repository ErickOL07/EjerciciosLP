/*
2. Modifique su programa anterior de tal forma que las atributos de la clase se
encuentren de forma privada. Desarrolle su solución en Python, C++, Ruby y
Smalltalk. Compare sus soluciones.
Nota: Recuerde que no es un curso de Python, C++ o Ruby, la sintaxis la
puede conseguir de cualquier libro. Se podrá cambiar de lenguaje en cualquier
momento del curso.
En el caso de Ruby y Python puede usar el siguiente compilador en línea:
https://www.onlinegdb.com/online_ruby_compiler
Para el caso de C++ puede ser CodeBlocks o algún compilador en línea.
En el caso de SmallTalk el siguiente compilador puede servir:
https://www.tutorialspoint.com/execute_smalltalk_online.php
*/

#include <iostream>
#include <cmath>

class Punto {
private:
    double x, y;

public:
    // Constructor
    Punto(double x, double y) : x(x), y(y) {}

    // Método para calcular la distancia entre dos puntos
    double distancia(const Punto& puntoB) const {
        return std::sqrt(std::pow(puntoB.x - x, 2) + std::pow(puntoB.y - y, 2));
    }

    // Método para obtener coordenadas (para imprimir en la salida)
    void imprimir() const {
        std::cout << "(" << x << ", " << y << ")";
    }
};

int main() {
    Punto p1(3, 5);
    Punto p2(8, 4);

    std::cout << "La distancia entre P1 ";
    p1.imprimir();
    std::cout << " y P2 ";
    p2.imprimir();
    std::cout << " es " << p1.distancia(p2) << "." << std::endl;

    return 0;
}
