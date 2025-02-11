-- 36. Defina una función que permita crear un BST.

-- Definición del tipo de dato para un árbol binario de búsqueda (BST)
data Tree = Empty              -- "Empty" representa un árbol vacío.
          | Node Int Tree Tree -- "Node" representa un nodo que contiene:
                                --   - Un valor entero.
                                --   - Un subárbol izquierdo (de tipo Tree).
                                --   - Un subárbol derecho (de tipo Tree).
          deriving Show       -- Permite convertir un árbol a String para imprimirlo.

--------------------------------------------------------------------------------
-- Función "insert"
-- Inserta un entero en un BST, manteniendo la propiedad de búsqueda:
-- * Los valores menores se ubican en el subárbol izquierdo.
-- * Los valores mayores se ubican en el subárbol derecho.
insert :: Int -> Tree -> Tree
insert x Empty = Node x Empty Empty
  -- Si el árbol es vacío (Empty), se crea un nodo con el valor "x" y sus dos subárboles son Empty.
insert x (Node n left right)
    | x < n     = Node n (insert x left) right
      -- Si "x" es menor que el valor "n" del nodo actual, se inserta "x" en el subárbol izquierdo.
    | x > n     = Node n left (insert x right)
      -- Si "x" es mayor que "n", se inserta "x" en el subárbol derecho.
    | otherwise = Node n left right
      -- Si "x" es igual a "n", no se inserta nada (se evitan duplicados) y se retorna el nodo tal como está.

--------------------------------------------------------------------------------
-- Función "crearBST"
-- Construye un BST a partir de una lista de enteros.
crearBST :: [Int] -> Tree
crearBST xs = foldl (\acc x -> insert x acc) Empty xs
  -- foldl: recorre la lista "xs" de izquierda a derecha, acumulando un resultado.
  -- "acc" es el árbol acumulado, que comienza siendo Empty.
  -- Para cada elemento "x" de la lista, se inserta en el árbol "acc" usando la función "insert".
  -- Al finalizar, se obtiene un BST con todos los elementos de la lista.
  
-- Alternativamente, se puede escribir de forma más concisa usando "flip":
-- crearBST xs = foldl (flip insert) Empty xs

main :: IO ()
main = do
    putStrLn "Creando un BST a partir de la lista [5,3,8,1,4,6,9]:"
    let bst = crearBST [5,3,8,1,4,6,9]
    print bst
