/*
12. Los empleados de una compañía X son divididos en dos categorías:
empleados a tiempo parcial y empleados a tiempo completo. 

Los empleados a tiempo parcial su sueldo se calcula según el número de
horas trabajadas al mes por el costo por hora que determine la empresa.

Los empleados a tiempo completo reciben un monto mensual fijo el cual
es afecto a un bono igual al 20% de su sueldo por cada año trabajado.

Realice un programa usando clases abstractas que permita calcular el sueldo
de un par de empleados a tiempo parcial y a tiempo completo.

Se sugiere que los datos de los empleados sean generados de forma aleatoria.
Diseñe su solución en Python, C++ y Ruby.
*/

#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>

using namespace std;

// Clase abstracta Empleado
class Empleado {
protected:
    int cod;
    char nomb;
    double sueldo;

public:
    Empleado() : cod(0), nomb(' '), sueldo(0.0) {}

    virtual void calcSueldo() = 0; // Método abstracto

    void generar() {
        cod = 100 + rand() % 801; // Código aleatorio entre 100 y 900
        nomb = 'A' + rand() % 26; // Letra aleatoria entre 'A' y 'Z'
    }

    virtual void imprimir() const {
        cout << "Empleado " << cod << " - Nombre: " << nomb << " - Sueldo: S/" << sueldo << endl;
    }

    double getSueldo() const {
        return sueldo;
    }
};

// Clase Empleado a Tiempo Completo (TC)
class TC : public Empleado {
private:
    int nA; // Años trabajados

public:
    TC(int nA = 0) : nA(nA) {
        generar();
        sueldo = 1000 + rand() % 8001; // Sueldo base aleatorio entre 1000 y 9000
    }

    void calcSueldo() override {
        sueldo += (nA * 0.2 * sueldo); // Bono del 20% por cada año trabajado
    }

    void imprimir() const override {
        cout << "Empleado TC " << cod << " - Nombre: " << nomb << " - Sueldo con bono: S/" << sueldo << endl;
    }
};

// Clase Empleado a Tiempo Parcial (TP)
class TP : public Empleado {
private:
    int hT; // Horas trabajadas
    int mH; // Monto por hora

public:
    TP() {
        generar();
        hT = 10 + rand() % 151;  // Horas trabajadas entre 10 y 160
        mH = 60 + rand() % 41;   // Monto por hora entre 60 y 100
    }

    void calcSueldo() override {
        sueldo = hT * mH;
    }

    void imprimir() const override {
        cout << "Empleado TP " << cod << " - Nombre: " << nomb << " - Sueldo: S/" << sueldo << endl;
    }
};

// Clase Departamento
class Departamento {
private:
    vector<Empleado*> listaEmp;

public:
    void agregarEmp(Empleado* objE) {
        listaEmp.push_back(objE);
    }

    void imprimir() const {
        for (const auto& emp : listaEmp) {
            emp->imprimir();
        }
    }

    ~Departamento() {
        for (auto& emp : listaEmp) {
            delete emp;
        }
    }
};

// Función principal
int main() {
    srand(time(0)); // Semilla para números aleatorios

    // Creación de empleados
    TC* objTC = new TC(5);
    objTC->calcSueldo();
    
    TP* objTP = new TP();
    objTP->calcSueldo();

    // Creación de departamento y adición de empleados
    Departamento objD;
    objD.agregarEmp(objTC);
    objD.agregarEmp(objTP);

    // Imprimir resultados
    cout << "\n=== EMPLEADOS ===" << endl;
    objD.imprimir();

    return 0;
}
