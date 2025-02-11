% 6. Realizar un programa que permita hallar los divisores de un número si usar
% recursividad o iteración.
%   Hint: Puede revisar el uso de la instrucción between, disponible en:
%   https://www.swi-prolog.org/pldoc/man?predicate=between/3
%   Del mismo modo el uso de la instrucción is puede ser de utilidad:
%   http://www.cse.unsw.edu.au/~billw/dictionaries/prolog/is.html

% Definir la regla para encontrar los divisores de un número N sin recursión ni iteración explícita
divisor(N, D) :- 
    between(1, N, D),  % Genera valores de D entre 1 y N
    N mod D =:= 0.     % Filtra los valores D que dividen exactamente a N

% Pseudocódigo:
% Regla: Encontrar los divisores de un número N
divisor(N, D) :- 
    between(1, N, D),  % Generar valores D entre 1 y N
    N mod D =:= 0.     % Verificar si D divide exactamente a N

% Consulta: Encontrar los divisores de 12
?- divisor(12, D).
% Prolog generará todos los valores de D entre 1 y 12.
% Filtrará aquellos que dividan exactamente a 12.
% Resultado esperado: D = 1 ; D = 2 ; D = 3 ; D = 4 ; D = 6 ; D = 12 ; false.