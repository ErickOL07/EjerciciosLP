% 8. Implemente un programa que permita determinar si un número es o no
% primo.

% Hecho: Definir que 1 no es un número primo
es_primo(1) :- false.

% Regla: Un número N es primo si no tiene divisores entre 2 y N-1
es_primo(N) :- N > 1, \+ tiene_divisores(N, 2).

% Regla: Verificar si N tiene un divisor en el rango [D, N-1]
tiene_divisores(N, D) :- 
    D * D =< N,    % Optimización: Solo verificar hasta la raíz cuadrada de N
    N mod D =:= 0. % Si N es divisible por D, entonces no es primo

% Regla: Si D no divide a N, probar con el siguiente número D+1
tiene_divisores(N, D) :- 
    D * D =< N,    % Seguir mientras D² ≤ N
    D1 is D + 1,   % Incrementar el divisor
    tiene_divisores(N, D1). % Llamar recursivamente con D1



% Pseudocódigo:

% HECHO: Definir que 1 no es primo
es_primo(1) :- false.  
% Si el número es 1, devolver false.

% REGLA: Determinar si un número N es primo
es_primo(N) :-  
    N > 1,                  % Verificar que N sea mayor que 1
    \+ tiene_divisores(N, 2). % Llamar a la regla que busca divisores desde 2

% REGLA: Verificar si N tiene un divisor entre 2 y N-1
tiene_divisores(N, D) :-  
    D * D =< N,            % Optimización: Solo verificar hasta sqrt(N)
    N mod D =:= 0.         % Si N es divisible por D, entonces no es primo

% REGLA: Si D no es divisor de N, seguir con el siguiente número
tiene_divisores(N, D) :-  
    D * D =< N,            % Seguir mientras D² ≤ N
    D1 is D + 1,           % Incrementar el divisor
    tiene_divisores(N, D1). % Llamado recursivo con D1

% CONSULTA: Verificar si 7 es primo
?- es_primo(7).  
% Prolog verifica si 7 tiene divisores entre 2 y sqrt(7).
% Resultado esperado: true.

% CONSULTA: Verificar si 10 es primo
?- es_primo(10).  
% Prolog verifica si 10 tiene divisores entre 2 y sqrt(10).
% Como 10 es divisible por 2, devuelve false.