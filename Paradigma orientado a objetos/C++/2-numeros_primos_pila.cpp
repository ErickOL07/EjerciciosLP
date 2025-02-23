/*
4. Escriba un programa que pida al usuario el ingreso de un número entero
positivo de tal manera que imprima todos los números primos hasta ese
número. Cree una clase denominada Pila (stack) la cual almacene estos
números primos y que luego imprima estos elementos en orden inverso.
Para este programa puede utilizar la estructura de datos list de Python así
como la instrucción pop(pos), esta instrucción devuelve el dato que almacena
una lista dada una posición determinada. Desarrollar su solución en Python.
Hacer su implementación en Python, C++ y Ruby.
*/  

#include <iostream>
#include <stack>
#include <cmath>

using namespace std;

// Función para verificar si un número es primo
bool esPrimo(int numero) {
    if (numero < 2) return false;
    for (int i = 2; i <= sqrt(numero); i++) {
        if (numero % i == 0) return false;
    }
    return true;
}

// Clase Pila (Stack)
class Pila {
private:
    stack<int> elementos;

public:
    void apilar(int elemento) {
        elementos.push(elemento);
    }

    void desapilar() {
        if (!elementos.empty()) {
            cout << elementos.top() << " ";
            elementos.pop();
        }
    }

    void imprimirInverso() {
        while (!elementos.empty()) {
            desapilar();
        }
        cout << endl;
    }
};

int main() {
    int n;
    cout << "Ingrese un número entero positivo: ";
    cin >> n;

    if (n <= 0) {
        cout << "Por favor, ingrese un número entero positivo." << endl;
        return 1;
    }

    Pila pilaPrimos;

    // Encontrar primos y apilarlos
    for (int num = 2; num <= n; num++) {
        if (esPrimo(num)) {
            pilaPrimos.apilar(num);
        }
    }

    // Imprimir en orden inverso
    cout << "Números primos en orden inverso: ";
    pilaPrimos.imprimirInverso();

    return 0;
}
