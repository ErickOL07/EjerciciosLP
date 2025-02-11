% 14. Realizar un programa que permita determinar si un número es perfecto en
% Prolog

% HECHO: Caso base - Si la suma de los divisores es igual al número, es perfecto
es_perfecto(N) :- 
    N > 0,                     % Verificar que el número sea positivo
    suma_divisores(N, 1, 0, Suma), % Calcular la suma de los divisores propios
    Suma =:= N.                 % Verificar si la suma es igual al número

% REGLA: Calcular la suma de los divisores propios de N usando recursión
suma_divisores(N, D, Acumulador, Suma) :- 
    D < N,                      % Verificar que D sea menor que N
    (N mod D =:= 0 ->           % Si D es divisor de N
        NuevoAcumulador is Acumulador + D  % Sumar D al acumulador
    ;   
        NuevoAcumulador is Acumulador      % Si no, dejar el acumulador igual
    ),   
    NuevoD is D + 1,             % Incrementar el divisor
    suma_divisores(N, NuevoD, NuevoAcumulador, Suma). % Llamado recursivo

% HECHO: Caso base de la suma de divisores
suma_divisores(N, N, Suma, Suma). 



% Pseudocódigo:

% HECHO: Determinar si un número es perfecto
es_perfecto(N) :-  
    N > 0,                      % Verificar que el número sea positivo
    suma_divisores(N, 1, 0, Suma), % Calcular la suma de los divisores propios
    Suma =:= N.                  % Comparar la suma con el número

% REGLA: Calcular la suma de los divisores propios usando recursión
suma_divisores(N, D, Acumulador, Suma) :-  
    D < N,                      % Verificar que D sea menor que N
    (N mod D =:= 0 ->           % Si D es divisor de N
        NuevoAcumulador is Acumulador + D  % Sumar D al acumulador
    ;   
        NuevoAcumulador is Acumulador      % Si no, mantener el acumulador
    ),   
    NuevoD is D + 1,            % Incrementar el divisor
    suma_divisores(N, NuevoD, NuevoAcumulador, Suma). % Llamado recursivo

% HECHO: Caso base de la suma de divisores
suma_divisores(N, N, Suma, Suma).  
% Si se llegó a N, devolver la suma acumulada.

% CONSULTA: Verificar si 6 es un número perfecto
?- es_perfecto(6).  
% La suma de sus divisores es 1 + 2 + 3 = 6.
% Resultado esperado: true.

% CONSULTA: Verificar si 28 es un número perfecto
?- es_perfecto(28).  
% La suma de sus divisores es 1 + 2 + 4 + 7 + 14 = 28.
% Resultado esperado: true.

% CONSULTA: Verificar si 12 es un número perfecto
?- es_perfecto(12).  
% La suma de sus divisores es 1 + 2 + 3 + 4 + 6 = 16 (no es perfecto).
% Resultado esperado: false.
