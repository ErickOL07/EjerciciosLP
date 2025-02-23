/*
9. Implementar una clase llamada Cola basado en el ADT Cola, con
operaciones de encolar y decolar. Basarse en la clase lista del programa
anterior, pero primero convierta su solución del problema 8 a C++.
*/

#include <iostream>
#include <vector>

using namespace std;

// Clase Cola basada en ListaArreglo
class Cola {
private:
    ListaArreglo lista;

public:
    void encolar(int n) {
        lista.agregarElemento(n);
    }

    int decolar() {
        if (esVacia()) {
            throw runtime_error("La cola está vacía, no se puede decolar.");
        }
        return lista.borrarElemento(0);  // Elimina el primer elemento
    }

    bool esVacia() const {
        return lista.estaVacia();
    }
};

// Función principal de prueba
int main() {
    Cola cola;

    // Encolamos elementos
    cola.encolar(10);
    cola.encolar(20);
    cola.encolar(30);

    cout << "¿La cola está vacía? " << (cola.esVacia() ? "Sí" : "No") << endl;

    // Decolamos elementos y los mostramos
    cout << "Elemento decolado: " << cola.decolar() << endl;
    cout << "Elemento decolado: " << cola.decolar() << endl;
    cout << "Elemento decolado: " << cola.decolar() << endl;

    cout << "¿La cola está vacía? " << (cola.esVacia() ? "Sí" : "No") << endl;

    return 0;
}
