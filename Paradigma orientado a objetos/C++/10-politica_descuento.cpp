/*
14. Siga los pasos que a continuación se describen:
a) Cree una clase abstracta llamada PoliticaDescuento. Esta clase deberá
tener un solo método abstracto llamado calculaDescuento, el cual retornará el
descuento por la compra de un número determinado de un artículo en
particular. El método tiene dos parámetros, cantidad y costoArticulo.

b) Derive una clase llamada DescuentoBloque de PoliticaDescuento. Esta
clase deberá tener un constructor con dos parámetros: mínimo y porcentaje. El
método calculaDescuento funcionará del siguiente modo, si la cantidad
adquirida de un artículo es mayor a un mínimo, el descuento será de un
porcentaje dado por la variable respectiva.

c) Derive una clase llamada CompreNArticulosConsigaUnoGratis de
Politica Descuento. Esta clase deberá de tener un constructor que tiene un solo
parámetro n. Esta clase implementará el método calculaDescuento de tal modo
que cada n artículo es gratis. Por ejemplo, la siguiente tabla da los descuentos
para la compra de varias cantidades de un artículo que cuesta $10, cuando n es
3:
Cantidad    1   2   3   4   5   6   7
Descuento   0   0   10  10  10  20  20

d) Derive una clase llamada DescuentoCombinado de PoliticaDescuento.
Su constructor tendrá dos parámetros de tipo PoliticaDescuento. Ésta deberá
implementar el método calculaDescuento para cada una de sus políticas de
descuento. Las políticas de descuento se encuentran en los ejercicios 5 y 6.
Adicionalmente cree un arreglo de objetos del tipo PoliticaDescuento e imprima
los descuentos respectivos de cada objeto.
Para el ejercicio planteado puede utilizar Herencia, Clases Abstractas o
Asociación según lo considere conveniente.
Desarrolle su solución en Python y C++.
*/

#include <iostream>
#include <vector>

using namespace std;

// Clase Abstracta PoliticaDescuento
class PoliticaDescuento {
protected:
    int cant;
    double cost, desc, total;

public:
    PoliticaDescuento(int cantidad, double costo) : cant(cantidad), cost(costo), desc(0) {
        total = cant * cost;
    }

    virtual double calcDesc() = 0; // Método abstracto

    double getTotal() const {
        return total;
    }

    double getDesc() const {
        return desc;
    }
};

// Clase DescuentoBloque (Hereda de PoliticaDescuento)
class DescBloque : public PoliticaDescuento {
private:
    int mini;
    double porc;

public:
    DescBloque(int cantidad, double costo, int minimo, double porcentaje)
        : PoliticaDescuento(cantidad, costo), mini(minimo), porc(porcentaje) {}

    double calcDesc() override {
        if (cant > mini) {
            desc = total * porc;
        } else {
            desc = 0;
        }
        return total - desc;
    }
};

// Clase CompreNArticulosConsigaUnoGratis (Hereda de PoliticaDescuento)
class CompreN : public PoliticaDescuento {
private:
    int n;

public:
    CompreN(int cantidad, double costo, int n)
        : PoliticaDescuento(cantidad, costo), n(n) {}

    double calcDesc() override {
        int artDesc = cant / n;
        desc = artDesc * cost;
        return total - desc;
    }
};

// Clase DescuentoCombinado (Combina dos políticas de descuento)
class DescComb : public PoliticaDescuento {
private:
    PoliticaDescuento* objDB;
    PoliticaDescuento* objCN;

public:
    DescComb(PoliticaDescuento* objDB, PoliticaDescuento* objCN)
        : PoliticaDescuento(0, 0), objDB(objDB), objCN(objCN) {}

    double calcDesc() override {
        double desc1 = objDB->calcDesc();
        double desc2 = objCN->calcDesc();
        return objDB->getTotal() - (objDB->getDesc() + objCN->getDesc());
    }
};

// Función principal
int main() {
    // Crear objetos de descuentos individuales
    DescBloque objDB1(5, 10, 3, 0.15);
    cout << "Descuento Bloque: " << objDB1.calcDesc() << endl;

    CompreN objCN1(5, 10, 3);
    cout << "Compra N: " << objCN1.calcDesc() << endl;

    // Crear un objeto que combina ambos descuentos
    DescComb objComb(&objDB1, &objCN1);
    cout << "Descuento Combinado: " << objComb.calcDesc() << endl;

    return 0;
}
