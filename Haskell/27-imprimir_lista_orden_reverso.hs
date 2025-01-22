-- 27. Realizar un par de funciones que impriman los elementos de una lista usando
-- recursividad, una de su funciones deberá imprimir los elementos en orden.
-- Para este programa se recomienda leer los elementos de la lista y usar cons
-- para simular la impresión de los elementos. Modifique luego su función de
-- imprimir los datos en reversa usando append.

l :: [Int]
l = [1, 2, 3, 4]

imprimirL :: [Int]->[Int]
imprimirL [] = []
imprimirL (x:xs) = x : imprimirL xs

invertirL :: [Int]->[Int]
invertirL [] = []
invertirL (x:xs) = invertirL xs ++ [x]

main :: IO()

main = do

    print(imprimirL l, invertirL l)