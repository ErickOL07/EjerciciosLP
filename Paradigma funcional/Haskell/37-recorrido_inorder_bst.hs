-- 37. Realice una función que realice el recorrido inorder de un BST.

-- Definición del tipo de dato para un árbol binario de búsqueda (BST).
-- Un árbol es:
--   - "Empty" si está vacío.
--   - "Node Int Tree Tree" si es un nodo que contiene un entero y dos subárboles.
data Tree = Empty              -- Representa un árbol vacío.
          | Node Int Tree Tree -- Representa un nodo con:
                                --   - Un valor entero.
                                --   - Un subárbol izquierdo (Tree).
                                --   - Un subárbol derecho (Tree).
          deriving Show       -- Permite mostrar (imprimir) el árbol.

--------------------------------------------------------------------------------
-- Función inorder
-- Realiza el recorrido inorder (en orden) de un BST, es decir, recorre:
--   1. El subárbol izquierdo.
--   2. El nodo actual.
--   3. El subárbol derecho.
-- Retorna una lista de enteros que corresponde al recorrido inorder.
inorder :: Tree -> [Int]
inorder Empty = []  
-- Si el árbol es Empty (vacío), el recorrido es una lista vacía.
inorder (Node n left right) =
  inorder left ++ [n] ++ inorder right
  -- Para un nodo (Node n left right):
  --   - Se realiza el recorrido inorder del subárbol izquierdo: "inorder left".
  --   - Se coloca el valor del nodo actual "n" en una lista: "[n]".
  --   - Se realiza el recorrido inorder del subárbol derecho: "inorder right".
  -- La concatenación de estas tres listas (usando "++") forma el recorrido inorder completo.

--------------------------------------------------------------------------------
-- Ejemplo de árbol BST para pruebas:
-- Representamos el siguiente árbol:
--
--          5
--         / \
--        3   8
--       / \ / \
--      1  4 6  9
--
-- Se construye de la siguiente manera:
tree :: Tree
tree = Node 5 
         (Node 3 
             (Node 1 Empty Empty)  -- Nodo con valor 1 (hoja).
             (Node 4 Empty Empty)  -- Nodo con valor 4 (hoja).
         )
         (Node 8
             (Node 6 Empty Empty)  -- Nodo con valor 6 (hoja).
             (Node 9 Empty Empty)  -- Nodo con valor 9 (hoja).
         )

main :: IO ()
main = do
    putStrLn "Recorrido inorder del BST:"
    let recorrido = inorder tree
    print recorrido