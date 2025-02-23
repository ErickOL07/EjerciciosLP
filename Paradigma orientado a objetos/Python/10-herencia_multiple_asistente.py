"""
10. Siguiendo el esquema dado para Herencia Múltiple resuelva el siguiente
caso: En algunas facultades los alumnos con mejores promedios son nombrados
asistentes de curso, es decir que cumplen algunas funciones del profesor del
curso como pudiera ser el dictado de las prácticas del curso. Se nos solicita un
programa de tal manera que se puedan imprimir los cursos que lleva un
estudiante, los cursos que dicta (o lleva) un profesor, y los cursos que dicta y
lleva un asistente de curso. Puede basarse en el siguiente esquema de clases:
(figura creada con: https://www.smartdraw.com/uml-diagram/uml-diagram-tool.htm)
"""

import random

cursos = [
    "DESARR.PERSONAL", "ÉTICA CÍVICA", "GLOB. Y REA. NAC.", "LENG.COMUNICACION I", "MATEMÁTICA BÁSICA",
    "METODO.INVESTIGACION", "ÁLGEB.LINEAL", "CÁLCULO I", "ECONO.EMPRESA", "LENG.COMUNICACION II",
    "PROC.SOCIAL.POLITICO", "TEMAS FILOSOFIA", "CÁLCULO II", "FÍSICA I", "ARQUI.COMPU.", "CÁLC. III",
    "ESTRUC.DISC.COMPUT.", "FUND.ING.SISTEMAS", "INFOR. GESTIÓN", "INTRO.PROGRAM.", "DES.COMPET.GEREN.",
    "ESTADIST. Y PROBABIL", "FUND.ELECT.Y ELECTRO", "GEST.CONTAB.", "ORG.EMPRE/BUSI.ORGAN", "SIST.OPERA.",
    "COM.DATOS", "MOD.E INTE. SISTE.", "PROG.ORIEN.OBJE.", "COSTEO OPER.", "EST.DAT.ALGOR.",
    "ESTADÍST. APLICADA", "ING.PROCE.NEGOCIO", "RED.COMPU.", "ARQUIT. TEC.INFORMA.",
    "COMP.NUBE/CLOUD COM.", "GEST.FINAN.", "ING.DATOS", "INVES.OPERAC.I", "LEGIS.Y ÉTICA",
    "SEM.REDES", "LENG.PROGRA.", "SIST.INTEL.EMP."
]

class Estudiante:

    def __init__(self, codE, listaCursosE):
        self.__codE = codE
        self.__listaCursosE = listaCursosE

    def imprimirC(self):
        print(f'Estudiante {self.__codE}:\n - Cursos: {self.__listaCursosE}')
    
class Profesor:

    def __init__(self, codP, listaCursosP):
        self.__codP = codP
        self.__listaCursosP = listaCursosP

    def imprimirC(self):
        print(f'Profesor {self.__codP}:\n - Cursos: {self.__listaCursosP}')
    
class Asistente(Estudiante, Profesor):

    def __init__(self, codA, listaCursosE, listaCursosD):
        """
        Constructor que inicializa un asistente.
        Un asistente es un estudiante que también dicta cursos, por lo que se hereda de Estudiante y Profesor.
        """
        # 🔹 Llamamos al constructor de la clase Estudiante (superclase 1)
        Estudiante.__init__(self, codA, listaCursosE)

        # 🔹 Llamamos al constructor de la clase Profesor (superclase 2)
        Profesor.__init__(self, codA, listaCursosD)
        self.__codA = codA

    def imprimirC(self):
        print(f"Asistente {self.__codA}:\n - Cursos matriculados: {self._Estudiante__listaCursosE}\n - Cursos dictados: {self._Profesor__listaCursosP}")

def generar_cursos(n):
    return random.sample(cursos, n)

# Main con gepeto xq me dio flojera hacer uno

# 🔹 Función para generar una lista aleatoria de cursos
def generar_cursos(n):
    return random.sample(cursos, n)

# 🔹 Programa principal con `random`
def main():
    random.seed()  # Asegura aleatoriedad en cada ejecución

    # Generar Estudiantes, Profesores y Asistentes
    estudiantes = [Estudiante(f"E{random.randint(100, 999)}", generar_cursos(random.randint(3, 6))) for _ in range(3)]
    profesores = [Profesor(f"P{random.randint(100, 999)}", generar_cursos(random.randint(2, 4))) for _ in range(3)]
    asistentes = [Asistente(f"A{random.randint(100, 999)}", generar_cursos(random.randint(2, 4)), generar_cursos(random.randint(1, 3))) for _ in range(2)]

    # 🔹 Imprimir la información generada
    print("\n=== ESTUDIANTES ===")
    for est in estudiantes:
        est.imprimirC()

    print("\n=== PROFESORES ===")
    for prof in profesores:
        prof.imprimirC()

    print("\n=== ASISTENTES ===")
    for asist in asistentes:
        asist.imprimirC()

if __name__ == "__main__":
    main()