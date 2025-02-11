% 10. Realizar un programa que en una lista ordenada busque un elemento
% mediante el algoritmo de búsqueda binaria. Su programa debería dar el
% resultado cuando se ejecute de la siguiente manera:
% ? binary_search(Key, [1, 2, 3, 4, 5], Result)

% HECHO: Caso base - Si la lista está vacía, el elemento no se encuentra.
binary_search(_, [], not_found).

% REGLA: Caso base - Si el elemento en la mitad es la clave, devolver el resultado.
binary_search(Key, List, Result) :-
    length(List, Len),            % Obtener la longitud de la lista
    Mid is Len // 2,              % Calcular la posición media
    nth0(Mid, List, Elem),        % Obtener el elemento en la posición media
    (Key =:= Elem -> Result = Elem; % Si Key es igual a Elem, devolverlo
     Key < Elem ->                % Si Key es menor, buscar en la mitad izquierda
        length(Left, Mid), append(Left, _, List),
        binary_search(Key, Left, Result);
     Key > Elem ->                % Si Key es mayor, buscar en la mitad derecha
        Mid1 is Mid + 1,
        length(_, Mid1), append(_, Right, List),
        binary_search(Key, Right, Result)
    ).



% Pseudocódigo:

% HECHO: Definir que si la lista está vacía, no se encuentra el elemento.
binary_search(_, [], not_found).  
% Si la lista es vacía, devolver not_found.

% REGLA: Buscar un elemento en una lista ordenada usando búsqueda binaria.
binary_search(Key, List, Result) :-  
    length(List, Len),             % Obtener la longitud de la lista.
    Mid is Len // 2,               % Calcular la posición media.
    nth0(Mid, List, Elem),         % Obtener el elemento en la posición media.
    
    (Key =:= Elem -> Result = Elem; % Si Key es igual a Elem, devolver el resultado.
     Key < Elem ->                 % Si Key es menor que Elem, buscar en la mitad izquierda.
        length(Left, Mid), append(Left, _, List), % Dividir la lista.
        binary_search(Key, Left, Result); % Llamar la regla de forma recursiva.
     Key > Elem ->                 % Si Key es mayor que Elem, buscar en la mitad derecha.
        Mid1 is Mid + 1,  
        length(_, Mid1), append(_, Right, List), % Dividir la lista.
        binary_search(Key, Right, Result) % Llamar la regla de forma recursiva.
    ).

% CONSULTA: Buscar el número 3 en la lista [1, 2, 3, 4, 5]
?- binary_search(3, [1, 2, 3, 4, 5], Result).  
% Resultado esperado: Result = 3.

% CONSULTA: Buscar el número 4 en la lista [1, 2, 3, 4, 5]
?- binary_search(4, [1, 2, 3, 4, 5], Result).  
% Resultado esperado: Result = 4.

% CONSULTA: Buscar el número 6 en la lista [1, 2, 3, 4, 5]
?- binary_search(6, [1, 2, 3, 4, 5], Result).  
% Resultado esperado: Result = not_found.
