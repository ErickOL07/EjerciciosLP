/*
7. Un pixel es igual a un punto con coordenadas (x,y) con la única diferencia
que un pixel contiene también un color, por ejemplo (x,y,”rojo”). Desarrollar un
programa que permita hallar la distancia entre dos pixels usando el programa
del punto desarrollado anteriormente. Implementar su solución en C++ y
Ruby.
*/

#include <iostream>
#include <cmath>
#include <map>
#include <string>

using namespace std;

class Pixel {
private:
    int x, y;
    int colorRGB[3]; // Arreglo para almacenar valores de color en RGB

    static map<string, int[3]> inicializarColores() {
        return {
            {"rojo", {255, 0, 0}}, {"verde", {0, 255, 0}}, {"azul", {0, 0, 255}},
            {"amarillo", {255, 255, 0}}, {"cian", {0, 255, 255}}, {"magenta", {255, 0, 255}},
            {"negro", {0, 0, 0}}, {"blanco", {255, 255, 255}}, {"gris", {128, 128, 128}},
            {"naranja", {255, 165, 0}}, {"morado", {128, 0, 128}}, {"rosado", {255, 192, 203}},
            {"marrón", {165, 42, 42}}
        };
    }

public:
    // Constructor
    Pixel(int x, int y, const string& color) : x(x), y(y) {
        static map<string, int[3]> coloresRGB = inicializarColores();
        if (coloresRGB.find(color) != coloresRGB.end()) {
            colorRGB[0] = coloresRGB[color][0];
            colorRGB[1] = coloresRGB[color][1];
            colorRGB[2] = coloresRGB[color][2];
        } else {
            // Si el color no existe, asignamos negro por defecto
            colorRGB[0] = 0;
            colorRGB[1] = 0;
            colorRGB[2] = 0;
        }
    }

    // Métodos para obtener coordenadas y color
    int getX() const { return x; }
    int getY() const { return y; }
    int* getColor() { return colorRGB; }

    // Método para calcular la distancia entre dos píxeles
    string distancia(const Pixel& pixelB) const {
        double distanciaEspacial = sqrt(pow(pixelB.x - x, 2) + pow(pixelB.y - y, 2));
        int colorDiferencia[3] = {
            abs(pixelB.colorRGB[0] - colorRGB[0]),
            abs(pixelB.colorRGB[1] - colorRGB[1]),
            abs(pixelB.colorRGB[2] - colorRGB[2])
        };

        return to_string(round(distanciaEspacial * 100000) / 100000) + " (" +
               to_string(colorDiferencia[0]) + ", " +
               to_string(colorDiferencia[1]) + ", " +
               to_string(colorDiferencia[2]) + ")";
    }
};

int main() {
    Pixel p1(3, 5, "rojo");
    Pixel p2(8, 4, "verde");

    cout << "La distancia entre P1 (" << p1.getX() << ", " << p1.getY() 
         << ", [" << p1.getColor()[0] << ", " << p1.getColor()[1] << ", " << p1.getColor()[2] << "]) y P2 ("
         << p2.getX() << ", " << p2.getY() << ", [" << p2.getColor()[0] << ", " 
         << p2.getColor()[1] << ", " << p2.getColor()[2] << "]) es " << p1.distancia(p2) << "." << endl;

    return 0;
}
