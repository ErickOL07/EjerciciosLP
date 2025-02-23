/*
10. Siguiendo el esquema dado para Herencia Múltiple resuelva el siguiente
caso: En algunas facultades los alumnos con mejores promedios son nombrados
asistentes de curso, es decir que cumplen algunas funciones del profesor del
curso como pudiera ser el dictado de las prácticas del curso. Se nos solicita un
programa de tal manera que se puedan imprimir los cursos que lleva un
estudiante, los cursos que dicta (o lleva) un profesor, y los cursos que dicta y
lleva un asistente de curso. Puede basarse en el siguiente esquema de clases:
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

// Clase Profesor
class Profesor {
protected:
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
};

// Clase Asistente (Herencia Múltiple de Estudiante y Profesor)
class Asistente : public Estudiante, public Profesor {
public:
    Asistente(string codigo, vector<Curso> cursosMatriculados, vector<Curso> cursosDictados, double bono)
        : Estudiante(codigo, cursosMatriculados), Profesor(codigo, cursosDictados, bono) {}

    void imprimir() {
        cout << "Asistente " << codE << ":" << endl;
        Estudiante::imprimir();
        Profesor::imprimir();
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

    Asistente a1("A100", cursosMatriculados, cursosDictados, 1000);
    a1.imprimir();

    return 0;
}
