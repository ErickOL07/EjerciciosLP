/*
6. Modifique el código de la pregunta anterior de tal manera que exista una
operación denominada incremento() que pertenezca a la clase ListaEmpleados.
Esta operación aumenta el salario de cada empleado en un 10%, hacer que su
programa imprima los salarios originales y los incrementados de todos los
trabajadores. Desarrolle dos soluciones en C++, una versión no deberá usar
punteros y la otra versión deberá usar punteros a fin de agregar los datos y un
destructor para liberar memoria.
*/

#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>

using namespace std;

class Empleado {
private:
    int codigo;
    char nombre;
    double salario;

public:
    // Constructor
    Empleado() {
        generar();
    }

    // Método para generar valores aleatorios
    void generar() {
        codigo = rand() % 801 + 100; // Código entre 100 y 900
        nombre = static_cast<char>(rand() % 26 + 65); // Letra entre 'A' y 'Z'
        salario = (rand() % 888 + 113) * 10; // Salario entre 1130 y 10000
    }

    // Métodos Get y Set
    double getSalario() const {
        return salario;
    }

    void setSalario(double nuevoSalario) {
        salario = nuevoSalario;
    }

    // Método para mostrar información del empleado
    void imprimir() const {
        cout << "- Código: " << codigo << "\n- Nombre: " << nombre << "\n- Salario: S/" << salario << "\n\n";
    }
};

class ListaEmpleados {
private:
    vector<Empleado> listaEmp;

public:
    void agregar(const Empleado &empleado) {
        listaEmp.push_back(empleado);
    }

    void imprimirEmpleados() const {
        for (size_t i = 0; i < listaEmp.size(); i++) {
            cout << "Empleado " << i + 1 << ":\n";
            listaEmp[i].imprimir();
        }
    }

    void incremento() {
        cout << "\n=== Incremento Salarial del 10% ===\n";
        for (size_t i = 0; i < listaEmp.size(); i++) {
            double salarioAnterior = listaEmp[i].getSalario();
            double nuevoSalario = salarioAnterior * 1.10;
            listaEmp[i].setSalario(nuevoSalario);
            cout << "Empleado " << i + 1 << ": Salario anterior: S/" << salarioAnterior 
                 << " -> Nuevo salario: S/" << nuevoSalario << "\n";
        }
        cout << "===================================\n\n";
    }
};

// Programa principal
int main() {
    srand(time(0)); // Semilla para generar números aleatorios

    ListaEmpleados lista;

    // Generar y agregar 10 empleados
    for (int i = 0; i < 10; i++) {
        Empleado empleado;
        lista.agregar(empleado);
    }

    // Imprimir empleados antes del aumento
    cout << "\n=== Lista de Empleados Original ===\n";
    lista.imprimirEmpleados();

    // Aplicar incremento del 10%
    lista.incremento();

    // Imprimir empleados después del aumento
    cout << "\n=== Lista de Empleados con Salario Incrementado ===\n";
    lista.imprimirEmpleados();

    return 0;
}
