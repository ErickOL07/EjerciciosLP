-- 35. Defina un árbol de números usando listas y luego realice una función que
-- devuelva verdadero si un elemento se encuentra en este árbol. En Racket un
-- árbol puede definirse del siguiente modo:
-- (define tree '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ()))))
-- En este árbol pruebe las siguientes instrucciones antes de hacer su programa:
-- (car tree)
-- (cadr tree)
-- (caddr tree)
-- Nota: Para el presente problema puede asumir que el árbol es un Binary
-- Search Tree.
-- (define tree '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ()))))

-- Definimos el tipo de dato para el árbol binario.
-- Un árbol binario se puede representar de dos formas:
--   1. Como un árbol vacío (Empty).
--   2. Como un nodo (Node) que contiene un entero y dos subárboles (izquierdo y derecho).
data Tree = Empty                   -- Representa un árbol vacío.
          | Node Int Tree Tree      -- Representa un nodo con:
                                    --   - Un valor entero.
                                    --   - Un subárbol izquierdo (Tree).
                                    --   - Un subárbol derecho (Tree).
          deriving Show             -- Permite que los valores de tipo Tree se conviertan a String,
                                    -- lo cual es útil para imprimirlos o depurarlos.

-- Ejemplo de árbol binario de búsqueda (BST):
--
--          5
--         / \
--        3   8
--       / \ / \
--      1  4 6  9
--
-- En un BST, para cada nodo, los valores en el subárbol izquierdo son menores que el valor del nodo,
-- y los valores en el subárbol derecho son mayores.
tree :: Tree
tree = Node 5                        -- Nodo raíz con el valor 5.
         (Node 3                   -- Subárbol izquierdo de la raíz: nodo con valor 3.
             (Node 1 Empty Empty)  -- Subárbol izquierdo de 3: nodo con valor 1, sin hijos (hoja).
             (Node 4 Empty Empty)  -- Subárbol derecho de 3: nodo con valor 4, sin hijos (hoja).
         )
         (Node 8                   -- Subárbol derecho de la raíz: nodo con valor 8.
             (Node 6 Empty Empty)  -- Subárbol izquierdo de 8: nodo con valor 6, sin hijos (hoja).
             (Node 9 Empty Empty)  -- Subárbol derecho de 8: nodo con valor 9, sin hijos (hoja).
         )

-- Función de búsqueda en un árbol binario de búsqueda (BST).
-- Dado que en un BST los valores menores se encuentran a la izquierda y
-- los mayores a la derecha, se puede optimizar la búsqueda:
--
-- buscar x tree devuelve True si x se encuentra en el árbol, o False en caso contrario.
buscar :: Int -> Tree -> Bool
buscar _ Empty = False               -- Si el árbol es Empty (vacío), no se encuentra el elemento.
buscar x (Node n left right)         -- Caso cuando el árbol es un nodo con:
  | x == n    = True                 -- Si el valor buscado x es igual al valor del nodo n, se encontró el elemento.
  | x < n     = buscar x left        -- Si x es menor que n, se busca recursivamente en el subárbol izquierdo.
  | otherwise = buscar x right       -- Si x es mayor que n, se busca recursivamente en el subárbol derecho.

-- Programa principal.
main :: IO ()
main = do
    putStrLn "Ingrese un número:"
    input <- getLine
    let n = read input :: Int
    let r = buscar n tree

    putStrLn $ "El número está en el árbol: " ++ show r