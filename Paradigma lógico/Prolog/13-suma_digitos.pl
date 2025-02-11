% 13. Encuentre la suma de los dígitos de un número usando Prolog.

% HECHO: Definir el caso base cuando el número es 0
suma_digitos(0, 0).

% REGLA: Calcular la suma de los dígitos usando recursión
suma_digitos(N, Res) :-
    N > 0,                     % Verificar que N sea mayor que 0
    Digito is N mod 10,         % Obtener el último dígito (N % 10)
    N1 is N // 10,             % Eliminar el último dígito (división entera)
    suma_digitos(N1, Res1),     % Llamar recursivamente con el número reducido
    Res is Digito + Res1.       % Sumar el dígito al resultado parcial



% Pseudocódigo:

% HECHO: Definir el caso base cuando el número es 0
suma_digitos(0, 0).  
% Si N es 0, devolver 0 como resultado.

% REGLA: Calcular la suma de los dígitos usando recursión
suma_digitos(N, Res) :-  
    N > 0,                      % Verificar que N sea mayor que 0
    Digito is N mod 10,          % Obtener el último dígito
    N1 is N // 10,              % Eliminar el último dígito
    suma_digitos(N1, Res1),      % Llamado recursivo con N1
    Res is Digito + Res1.        % Sumar el dígito al resultado parcial

% CONSULTA: Calcular la suma de los dígitos de 123
?- suma_digitos(123, Result).  
% Prolog calculará la suma de 1 + 2 + 3 usando recursión.
% Resultado esperado: Result = 6.

% CONSULTA: Calcular la suma de los dígitos de 9876
?- suma_digitos(9876, Result).  
% Prolog calculará la suma de 9 + 8 + 7 + 6.
% Resultado esperado: Result = 30.