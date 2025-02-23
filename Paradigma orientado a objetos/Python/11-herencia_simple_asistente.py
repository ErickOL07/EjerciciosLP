"""
11. En algunas ocasiones se menciona que la herencia múltiple puede ser la
consecuencia de un mal diseño, debido a esto se le solicita cambiar su programa
de la pregunta anterior a fin que tan sólo se utilice herencia simple.
Nota: Puede utilizar herencia con una clase y asociación con la otra.
Diseñe su solución en Ruby.
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

    def getListaCursosP(self):
        return self.__listaCursosP

    def imprimirC(self):
        print(f'Profesor {self.__codP}:\n - Cursos: {self.__listaCursosP}')
    
class Asistente(Estudiante):

    def __init__(self, codA, listaCursosE, profesor):
        Estudiante.__init__(self, codA, listaCursosE)
        self.__profesor = profesor

    def imprimirC(self):
        print(f"Asistente {self._Estudiante__codE}:\n - Cursos matriculados: {self._Estudiante__listaCursosE}\n - Cursos dictados: {self.__profesor.getListaCursosP()}")

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
    asistentes = [Asistente(f"A{random.randint(100, 999)}", generar_cursos(random.randint(2, 4)), random.choice(profesores)) for _ in range(2)]

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