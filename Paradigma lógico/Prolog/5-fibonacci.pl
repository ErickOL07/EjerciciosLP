% 5. Realizar un programa que calcule la serie Fibonacci de un número n.

% Caso base 1: El primer número de la serie de Fibonacci es 0.
fibonacci(0,0).

% Caso base 2: El segundo número de la serie de Fibonacci es 1.
fibonacci(1,1).

% Regla recursiva: Calcular Fibonacci de N usando los dos anteriores.
fibonacci(N, Res) :-  
    N > 1,              % Se asegura de que N sea mayor que 1.
    N1 is N - 1,        % Calcula el término anterior (N-1).
    N2 is N - 2,        % Calcula el término anterior al anterior (N-2).
    fibonacci(N1, Res1), % Llamada recursiva para calcular Fibonacci(N-1).
    fibonacci(N2, Res2), % Llamada recursiva para calcular Fibonacci(N-2).
    Res is Res1 + Res2.  % Suma los dos términos anteriores para obtener el resultado.


% Pseudocódigo:
% Caso base: Definir los primeros valores de la serie Fibonacci
fibonacci(0, 0).  % Fibonacci de 0 es 0
fibonacci(1, 1).  % Fibonacci de 1 es 1

% Caso recursivo: Calcular Fibonacci de N sumando los dos valores anteriores
fibonacci(N, Res) :- 
    N > 1,              % Verificar que N es mayor que 1
    N1 is N - 1,        % Calcular el término anterior (N-1)
    N2 is N - 2,        % Calcular el término dos posiciones atrás (N-2)
    fibonacci(N1, Res1), % Llamada recursiva para obtener fibonacci(N-1)
    fibonacci(N2, Res2), % Llamada recursiva para obtener fibonacci(N-2)
    Res is Res1 + Res2.  % Sumar ambos resultados

% Consulta: Calcular Fibonacci de 5
?- fibonacci(5, F).  
% Resultado esperado: F = 5