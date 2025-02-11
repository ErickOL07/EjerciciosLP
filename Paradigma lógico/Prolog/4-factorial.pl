% 4. Realizar un programa que calcule el factorial de un número.
factorial(1,1).
factorial(N,Res) :- N1 is N-1, factorial(N1,Res2), Res is Res2*N.

? factorial(4,F). % functor, el resultado está enlazado a una variable

% Interpretación:
factorial(1,1) % es un fact
factorial(4, Res), % en la primera llamada se hace un match con la regla
factorial(N,Res).
% Se calcula n1 volviendo a N-1 igual a 3.
% Se intenta calcular factorial(3,Res2), luego factorial(2,Res3), factorial(1,Res4).
% En este caso se alcanza el caso base (fact) el cual es factorial(1,1), Res4=1
% Res3=Res4*2, Res2=Res3*3, al final Res=Res*4; es decir:
% Res=4*3*2*1=24



% Definir el caso base del factorial
factorial(1,1).  
% Esto indica que el factorial de 1 es 1.
% En recursión, el caso base es necesario para detener la recursión.

% Definir la regla recursiva para calcular el factorial de un número N
factorial(N,Res) :-  
    N1 is N-1,         % Paso 1: Calcular el valor de N-1 y almacenarlo en N1.
    factorial(N1,Res2), % Paso 2: Llamada recursiva para calcular el factorial de N1 (N-1).
    Res is Res2 * N.    % Paso 3: Multiplicar el resultado anterior (Res2) por N para obtener Res.

% Pseudocódigo:
% Definir el caso base del factorial
factorial(1,1).  
% Si N es 1, devolver 1 como resultado.

% Definir la regla recursiva para calcular el factorial de un número N
factorial(N,Res) :-  
    N1 is N-1,         % Restar 1 a N y almacenarlo en N1.
    factorial(N1,Res2), % Llamar recursivamente a factorial con N1.
    Res is Res2 * N.    % Multiplicar el resultado anterior por N.

% Consulta: Calcular el factorial de 4.
?- factorial(4,F).  
% Prolog resolverá la consulta usando recursión.
% Resultado esperado: F = 24.
