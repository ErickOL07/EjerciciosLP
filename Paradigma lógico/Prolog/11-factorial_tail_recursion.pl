% 11. Realizar el programa del factorial, pero usando tail recursión. Su programa
% deberá ejecutarse del siguiente modo:
% factorial(4, Result).

% HECHO: Caso base - El factorial de 0 es 1
factorial_tail(0, Acc, Acc).

% REGLA: Calcular el factorial usando tail recursion
factorial_tail(N, Acc, Result) :-
    N > 0,                 % Verificar que N sea mayor que 0
    Acc1 is Acc * N,       % Multiplicar el acumulador por N
    N1 is N - 1,           % Restar 1 a N
    factorial_tail(N1, Acc1, Result). % Llamar recursivamente con N1 y Acc1

% REGLA PRINCIPAL: Iniciar la recursión con un acumulador en 1
factorial(N, Result) :-
    factorial_tail(N, 1, Result).




% Pseudocódigo:

% HECHO: Definir el caso base (0! = 1)
factorial_tail(0, Acc, Acc).  
% Si N es 0, devolver el acumulador como resultado.

% REGLA: Calcular el factorial usando tail recursion
factorial_tail(N, Acc, Result) :-  
    N > 0,                % Verificar que N sea mayor que 0
    Acc1 is Acc * N,      % Multiplicar el acumulador por N
    N1 is N - 1,          % Restar 1 a N
    factorial_tail(N1, Acc1, Result). % Llamado recursivo con N1 y Acc1

% REGLA PRINCIPAL: Iniciar la recursión con un acumulador en 1
factorial(N, Result) :-  
    factorial_tail(N, 1, Result).  
% Llamar a la función auxiliar con acumulador inicial 1.

% CONSULTA: Calcular el factorial de 4
?- factorial(4, Result).  
% Prolog calculará 4! usando tail recursion.
% Resultado esperado: Result = 24.

% CONSULTA: Calcular el factorial de 6
?- factorial(6, Result).  
% Prolog calculará 6! = 720.
% Resultado esperado: Result = 720.