% 1. Interpretar y ejecutar el siguiente programa:

% Regla 1: Definir que una persona (X) existe si alguien (Y) es su madre
persona(X) :- madreDe(Y, X).  
% Esto significa que X será considerado una persona si existe un Y tal que madreDe(Y, X) sea verdadero.

% Regla 2: Definir que una persona (Y) existe si él o ella es madre de alguien (X)
persona(Y) :- madreDe(Y, X).  
% Esto significa que Y también será considerado una persona si es madre de X.

% Hecho 1: María es la madre de Carmen
madreDe(maria, carmen).

% Hecho 2: María es la madre de Alexandre
madreDe(maria, alexandre).

% Hecho 3: María es la madre de Andrés
madreDe(maria, andres).

% Consulta (No debe estar en el archivo .pl, solo se ejecuta en SWI-Prolog)
?- persona(maria).
% Esto consulta si María es considerada una persona según nuestras reglas.


% Errores en el código original

% ❌ Regla duplicada:
% La segunda regla persona(Y) :- madreDe(Y, X). es redundante porque la primera regla ya cubre este caso.

% ❌ Consulta dentro del archivo:
% En Prolog, las consultas (?-) no deben incluirse dentro del código fuente. Se ejecutan en la terminal.

% Código corregido: 

% Hechos: Definimos quién es madre de quién
madreDe(maria, carmen).
madreDe(maria, alexandre).
madreDe(maria, andres).

% Regla: Una persona es alguien que tiene una madre registrada en la base de datos
persona(X) :- madreDe(_, X).  
% X será considerado persona si existe alguien (no nos importa quién) que sea su madre.

% NOTA: No incluir consultas dentro del archivo .pl, solo se ejecutan en la terminal SWI-Prolog.


% Pseudocódigo:

% Declarar que María es madre de Carmen
madreDe(maria, carmen).  
% Declarar que María es madre de Alexandre
madreDe(maria, alexandre).  
% Declarar que María es madre de Andrés
madreDe(maria, andres).  

% Definir que alguien (X) es una persona si tiene una madre registrada en la base de datos
persona(X) :- madreDe(_, X).  
% Buscar en la base de datos si existe un registro madreDe(_, X).
% Si hay coincidencia, considerar a X como una persona.

% NOTA: Ejecutar consultas como:
% ?- persona(carmen).  % Retornará true porque Carmen tiene madre registrada (María).
% ?- persona(maria).   % Retornará false porque no hay un registro que diga que María tiene madre.

/*
Explicación de lo que hace:

Declarar los hechos sobre quién es madre de quién:
    Declarar que María es madre de Carmen. madreDe(maria, carmen).
    Declarar que María es madre de Alexandre. madreDe(maria, alexandre).
    Declarar que María es madre de Andrés. madreDe(maria, andres).  

Definir la regla para determinar si alguien es una persona:
    Si existe un registro en la base de datos donde alguien es madre de X, entonces X es una persona.
    persona(X) :- madreDe(_, X).  

Ejecutar consultas manualmente en SWI-Prolog:
    Consultar si Carmen es persona. ?- persona(carmen).
    Consultar si María es persona. ?- persona(maria).
*/