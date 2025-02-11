% 12. Modifique el programa del Fibonacci para que se use tail recursión.

% HECHO: Definir el caso base cuando N = 0
fibonacci_tail(0, A, _, A).

% HECHO: Definir el caso base cuando N = 1
fibonacci_tail(1, _, B, B).

% REGLA: Calcular Fibonacci usando tail recursion
fibonacci_tail(N, A, B, Result) :-
    N > 1,                  % Verificar que N sea mayor que 1
    N1 is N - 1,            % Reducir N en 1
    Next is A + B,          % Sumar los dos términos anteriores
    fibonacci_tail(N1, B, Next, Result). % Llamar recursivamente con nuevos valores

% REGLA PRINCIPAL: Iniciar la recursión con valores iniciales 0 y 1
fibonacci(N, Result) :-
    fibonacci_tail(N, 0, 1, Result).



% Pseudocódigo:

% HECHO: Definir el caso base cuando N = 0
fibonacci_tail(0, A, _, A).  
% Si N es 0, devolver A (primer número de Fibonacci).

% HECHO: Definir el caso base cuando N = 1
fibonacci_tail(1, _, B, B).  
% Si N es 1, devolver B (segundo número de Fibonacci).

% REGLA: Calcular Fibonacci usando tail recursion
fibonacci_tail(N, A, B, Result) :-  
    N > 1,                  % Verificar que N sea mayor que 1
    N1 is N - 1,            % Reducir N en 1
    Next is A + B,          % Sumar los dos términos anteriores
    fibonacci_tail(N1, B, Next, Result). % Llamado recursivo con nuevos valores

% REGLA PRINCIPAL: Iniciar la recursión con valores iniciales 0 y 1
fibonacci(N, Result) :-  
    fibonacci_tail(N, 0, 1, Result).  
% Llamar a la función auxiliar con A = 0 y B = 1.

% CONSULTA: Calcular el término 5 de la serie de Fibonacci
?- fibonacci(5, Result).  
% Prolog calculará el quinto número de Fibonacci.
% Resultado esperado: Result = 5.

% CONSULTA: Calcular el término 7 de la serie de Fibonacci
?- fibonacci(7, Result).  
% Prolog calculará el séptimo número de Fibonacci.
% Resultado esperado: Result = 13.