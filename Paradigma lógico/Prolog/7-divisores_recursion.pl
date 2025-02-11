% 7. Realice un programa que obtenga los divisores de un número, pero haciendo
% uso de recursividad.
% Hint: En Prolog la comparativa <= se escribe =<

% Caso base: Cuando el divisor actual supera a N, se detiene la recursión
divisores(N, D, []) :- D > N, !. 

% Caso recursivo: Si D es divisor de N, lo agregamos a la lista
divisores(N, D, [D | Resto]) :- 
    N mod D =:= 0,       % Verificar si D es divisor de N
    D1 is D + 1,         % Incrementar el divisor
    divisores(N, D1, Resto). % Llamada recursiva con el siguiente divisor

% Caso recursivo: Si D no es divisor de N, continuar sin agregarlo
divisores(N, D, Resto) :- 
    N mod D =\= 0,       % Verificar si D no es divisor de N
    D1 is D + 1,         % Incrementar el divisor
    divisores(N, D1, Resto). % Llamada recursiva con el siguiente divisor

% Regla principal: Iniciar la recursión desde 1
divisores(N, Lista) :- divisores(N, 1, Lista).


% Pseudocódigo:

% Caso base: Si D supera a N, detener la recursión
divisores(N, D, []) :- D > N, !. 

% Caso recursivo: Si D es divisor de N, agregarlo a la lista
divisores(N, D, [D | Resto]) :- 
    N mod D =:= 0,  % Si D divide exactamente a N
    D1 is D + 1,    % Avanzar al siguiente número
    divisores(N, D1, Resto). % Llamado recursivo con D1

% Caso recursivo: Si D no es divisor de N, continuar sin agregarlo
divisores(N, D, Resto) :- 
    N mod D =\= 0,  % Si D NO divide exactamente a N
    D1 is D + 1,    % Avanzar al siguiente número
    divisores(N, D1, Resto). % Llamado recursivo con D1

% Regla principal: Iniciar desde 1
divisores(N, Lista) :- divisores(N, 1, Lista).

% Consulta: Encontrar los divisores de 12
?- divisores(12, Lista).
% Prolog genera la lista de divisores de 12.
% Resultado esperado: Lista = [1, 2, 3, 4, 6, 12].