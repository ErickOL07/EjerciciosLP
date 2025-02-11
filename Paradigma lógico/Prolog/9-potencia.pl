% 9. Realizar un programa que eleve un número enterno b a un exponente e.

% HECHO: Definir el caso base (cualquier número elevado a la 0 es 1)
potencia(_, 0, 1).  

% REGLA: Calcular la potencia recursivamente cuando el exponente es positivo
potencia(B, E, Res) :-  
    E > 0,               % Verificar que el exponente sea mayor que 0
    E1 is E - 1,         % Restar 1 al exponente
    potencia(B, E1, Res1), % Llamar recursivamente con el exponente reducido
    Res is B * Res1.     % Multiplicar el resultado parcial por la base

% REGLA: Calcular la potencia cuando el exponente es negativo
potencia(B, E, Res) :-  
    E < 0,               % Verificar que el exponente sea negativo
    E1 is E + 1,         % Sumar 1 al exponente para acercarlo a 0
    potencia(B, E1, Res1), % Llamar recursivamente con el exponente aumentado
    Res is Res1 / B.     % Dividir el resultado parcial por la base



% Pseudocódigo:

% HECHO: Definir el caso base (b^0 = 1)
potencia(_, 0, 1).  
% Si el exponente es 0, devolver 1.

% REGLA: Calcular la potencia cuando el exponente es positivo
potencia(B, E, Res) :-  
    E > 0,                 % Verificar que el exponente sea mayor que 0
    E1 is E - 1,           % Restar 1 al exponente
    potencia(B, E1, Res1), % Llamar recursivamente con el exponente reducido
    Res is B * Res1.       % Multiplicar el resultado parcial por la base

% REGLA: Calcular la potencia cuando el exponente es negativo
potencia(B, E, Res) :-  
    E < 0,                 % Verificar que el exponente sea negativo
    E1 is E + 1,           % Sumar 1 al exponente para acercarlo a 0
    potencia(B, E1, Res1), % Llamar recursivamente con el exponente aumentado
    Res is Res1 / B.       % Dividir el resultado parcial por la base

% CONSULTA: Elevar 2 a la potencia de 3
?- potencia(2, 3, Res).  
% Prolog calculará 2^3 usando recursión.
% Resultado esperado: Res = 8.

% CONSULTA: Elevar 5 a la potencia de -2
?- potencia(5, -2, Res).  
% Prolog calculará 5^(-2) = 1 / (5^2) = 1/25.
% Resultado esperado: Res = 0.04.