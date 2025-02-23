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

class Estudiante():
    def __init__(self,codE,listaE):
        #listaE sonn los cursos mat del estudiante
        self.codE=codE
        self.listaE=listaE
        
    def imprimir(self):
        #imprime los cursos matriculados
        print("est ",self.codE,"cursos mat")
        for i in range (0,len(self.listaE)):
            print(self.listaE[i].codC,",",self.listaE[i].nomC)

class Profesor():
    #constructor permitira generar un prof inicial sin cod
    def __init__(self,listaD,sueldo,codP=None):
        self.codP=codP
        self.listaD=listaD
        self.sueldo=sueldo
    
    def imprimir(self):
        print("prof ",self.codP," cursos dicta")
        for i in range(0,len(self.listaD)):
            print(self.listaD[i].codC,", ",self.listaD[i].nomC)
    

class Asistente(Estudiante,Profesor):
    def __init__(self,codA,listaM,listaD,bono):
        Estudiante.__init__(self, codA, listaM)
        Profesor.__init__(self, listaD, bono)
    
    def imprimir(self):
        print("Asistente")
        Estudiante.imprimir(self)
        Profesor.imprimir(self)
        
class Curso():
    def __init__(self,codC,nomC):
        self.codC=codC
        self.nomC=nomC


def main():
    c1=Curso("c10","java")
    c2=Curso("c20","calculo")
    c3=Curso("c30","lenguaje")
    c4=Curso("c40","mate")
    
    #lista de cursos matriculados
    listaCursoM=[]
    listaCursoD=[]
    
    listaCursoM.append(c1)
    listaCursoM.append(c2)
    listaCursoD.append(c3)
    listaCursoD.append(c4)
    
    e1=Estudiante("e100", listaCursoM)
    e1.imprimir()
    print("\n")
    
    p1=Profesor(listaCursoD,2000,"p100")
    p1.imprimir()
    print("\n")
    
    a1=Asistente("a100", listaCursoM, listaCursoD, 1000)
    a1.imprimir()
    
main()