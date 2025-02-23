/*
11. En algunas ocasiones se menciona que la herencia múltiple puede ser la
consecuencia de un mal diseño, debido a esto se le solicita cambiar su programa
de la pregunta anterior a fin que tan sólo se utilice herencia simple.
Nota: Puede utilizar herencia con una clase y asociación con la otra.
Diseñe su solución en Ruby.
*/

#include <iostream>
#include <vector>

using namespace std;

// Clase Curso
class Curso {
public:
    string codC;
    string nomC;

    Curso(string codigo, string nombre) : codC(codigo), nomC(nombre) {}
};

// Clase Profesor
class Profesor {
private:
    string codP;
    vector<Curso> listaD; // Cursos dictados
    double sueldo;

public:
    Profesor(string codigo, vector<Curso> cursos, double sueldo) : codP(codigo), listaD(cursos), sueldo(sueldo) {}

    void imprimir() {
        cout << "Profesor " << codP << " - Cursos dictados:" << endl;
        for (const Curso& curso : listaD) {
            cout << curso.codC << ", " << curso.nomC << endl;
        }
    }

    vector<Curso> getListaCursos() const {
        return listaD;
    }
};

// Clase Estudiante
class Estudiante {
protected:
    string codE;
    vector<Curso> listaE; // Cursos matriculados

public:
    Estudiante(string codigo, vector<Curso> cursos) : codE(codigo), listaE(cursos) {}

    void imprimir() {
        cout << "Estudiante " << codE << " - Cursos matriculados:" << endl;
        for (const Curso& curso : listaE) {
            cout << curso.codC << ", " << curso.nomC << endl;
        }
    }
};

// Clase Asistente (Hereda de Estudiante y usa Asociación con Profesor)
class Asistente : public Estudiante {
private:
    Profesor* profesor; // Asociación con un Profesor

public:
    Asistente(string codigo, vector<Curso> cursosMatriculados, Profesor* profe)
        : Estudiante(codigo, cursosMatriculados), profesor(profe) {}

    void imprimir() {
        cout << "Asistente " << codE << ":" << endl;
        Estudiante::imprimir();
        cout << "Cursos que dicta como asistente:" << endl;
        for (const Curso& curso : profesor->getListaCursos()) {
            cout << curso.codC << ", " << curso.nomC << endl;
        }
    }
};

// Función principal
int main() {
    Curso c1("C10", "Java");
    Curso c2("C20", "Cálculo");
    Curso c3("C30", "Lenguaje");
    Curso c4("C40", "Matemáticas");

    vector<Curso> cursosMatriculados = {c1, c2};
    vector<Curso> cursosDictados = {c3, c4};

    Estudiante e1("E100", cursosMatriculados);
    e1.imprimir();
    cout << endl;

    Profesor p1("P100", cursosDictados, 2000);
    p1.imprimir();
    cout << endl;

    Asistente a1("A100", cursosMatriculados, &p1);
    a1.imprimir();

    return 0;
}
