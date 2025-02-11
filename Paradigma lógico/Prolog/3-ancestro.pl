% 3. Ejecutar el código siguiente y revisar el backtracking.

/*
Backtracking es el mecanismo de búsqueda que usa Prolog para
encontrar soluciones a una consulta. Prolog intenta resolver
una consulta siguiendo las reglas y hechos disponibles en la
base de conocimiento. Si en algún punto no puede continuar,
retrocede (backtrack) al último punto de decisión y prueba
una alternativa diferente.
*/

ancestro(X,Y):-padre(X,Z),ancestro(Z,Y).
% Regla recursiva: X es ancestro de Y si X es padre de Z y Z es ancestro de Y.

ancestro(X,X).          % Hecho 1: X es ancestro de X.
padre(amy,bob).         % Hecho 2: Amy es padre de Bob.

?- ancestro(H,bob)      % Consulta: ¿Quiénes son ancestros de Bob?

/* Proceso de Backtracking

Prolog intentará responder la consulta ancestro(H, bob).
Veamos paso a paso:

1. Busca una regla para ancestro(H, bob).

    Encuentra la primera regla recursiva:               */
    ancestro(X,Y) :- padre(X,Z), ancestro(Z,Y).
/*  
    Esto significa que Prolog intentará encontrar a
    alguien (X) que sea padre de otro (Z) que a su vez
    sea ancestro de bob.

2. Verifica el hecho padre(amy, bob).

    Aquí, X = amy y Z = bob, por lo que ahora Prolog debe
    resolver ancestro(bob, bob).

3. Verifica la segunda regla ancestro(X, X).

    Como ancestro(bob, bob) coincide con la regla base ancestro(X, X),
    se satisface y Prolog devuelve la primera solución:

    H = amy.

¿Qué pasa después?

    Prolog ahora hace backtracking para ver si hay más soluciones.
    Vuelve al punto de decisión y revisa si hay más hechos padre(X, Z).
    Como no hay más hechos padre/2, no encuentra más soluciones y termina.
*/


% Pseudocódigo:

% Definir la relación de ancestro.
% Una persona X es ancestro de Y si:
% 1. X es padre de Z
% 2. Z es ancestro de Y
ancestro(X, Y) :- padre(X, Z), ancestro(Z, Y).

% Caso base:
% Toda persona es su propio ancestro.
ancestro(X, X).

% Declarar el hecho de que Amy es padre/madre de Bob.
padre(amy, bob).

% Consultar: ¿Quién es ancestro de Bob?
% Prolog intentará resolver la consulta ?- ancestro(H, bob).

% Paso 1: Aplicar la regla ancestro(X, Y).
% - Buscar un valor de X tal que X sea padre de Z y Z sea ancestro de Y.

% Paso 2: Encontrar un padre de Bob en la base de datos.
% - Encontramos que "padre(amy, bob)" está registrado.
% - Entonces, H = amy, y ahora debemos verificar ancestro(bob, bob).

% Paso 3: Aplicar el caso base ancestro(X, X).
% - Como ancestro(bob, bob) siempre es cierto, la consulta es exitosa.

% Respuesta:
% - H = amy.

% Paso 4: Backtracking.
% - Prolog intenta encontrar más soluciones retrocediendo a la regla ancestro(X, Y).
% - No hay más hechos padre(X, Z), así que la búsqueda termina.
