% 2. Ejecutar el siguiente programa:

humano(socrates).       % Hecho 1: Sócrates es humano.
humano(juan).           % Hecho 2: Juan es humano.
humano(maria).          % Hecho 3: María es humana.

mortal(X):-humano(X).   % Regla: X será considerado mortal si X es un humano.

?- humano(maria)        % Consultar si María es humana.
% Debería devolver true porque humano(maria) está definido.

? mortal(jose)          % Consultar si José es mortal.
% Debería devolver false porque no hay un hecho humano(jose).


% Pseudocódigo:

% Declarar que Sócrates es humano.
humano(socrates).   

% Declarar que Juan es humano.
humano(juan).       

% Declarar que María es humana.
humano(maria).      

% Definir que un ser X es mortal si es humano.
mortal(X) :- humano(X).  

% Consultar si María es humana.
% ¿María está en la base de datos como humana? 
% Si sí, devolver true. 

% Consultar si José es mortal.
% Buscar si José es humano en la base de datos.
% Si no está registrado, devolver false.    