/*
8. Implementar una clase llamada Pila, la cual tenga las operaciones de
apilar(n), desapilar() y esVacia() la cual deberá ser formada a partir de una
clase denominada ListaArreglo. La clase Lista tendrá las operaciones de
agregarElemento(n), borrarElemento(pos) y utilizará como estructura de datos
del tipo list. Solamente podrá utilizar las siguientes operaciones de listas en
Python():
pop(): elimina un elemento de una lista dada en una posición determinada
append(n): agrega un elemento a la lista
*/

#include <iostream>
#include <vector>

using namespace std;

// Clase ListaArreglo (Base para Pila y Cola)
class ListaArreglo {
private:
    vector<int> lista;

public:
    void agregarElemento(int n) {
        lista.push_back(n);  // Similar a append() en Python
    }

    int borrarElemento(int pos) {
        if (pos < 0 || pos >= lista.size()) {
            throw out_of_range("Índice fuera de rango");
        }
        int elemento = lista[pos];
        lista.erase(lista.begin() + pos);  // Similar a pop(pos) en Python
        return elemento;
    }

    bool estaVacia() const {
        return lista.empty();
    }

    size_t tamano() const {
        return lista.size();
    }

    int obtenerUltimo() const {
        return lista.back();
    }
};

// Clase Pila basada en ListaArreglo
class Pila {
private:
    ListaArreglo lista;

public:
    void apilar(int n) {
        lista.agregarElemento(n);
    }

    int desapilar() {
        if (esVacia()) {
            throw runtime_error("La pila está vacía, no se puede desapilar.");
        }
        return lista.borrarElemento(lista.tamano() - 1);
    }

    bool esVacia() const {
        return lista.estaVacia();
    }
};

// Función principal de prueba
int main() {
    Pila pila;

    // Apilamos elementos
    pila.apilar(10);
    pila.apilar(20);
    pila.apilar(30);

    cout << "¿La pila está vacía? " << (pila.esVacia() ? "Sí" : "No") << endl;

    // Desapilamos elementos y los mostramos
    cout << "Elemento desapilado: " << pila.desapilar() << endl;
    cout << "Elemento desapilado: " << pila.desapilar() << endl;
    cout << "Elemento desapilado: " << pila.desapilar() << endl;

    cout << "¿La pila está vacía? " << (pila.esVacia() ? "Sí" : "No") << endl;

    return 0;
}
