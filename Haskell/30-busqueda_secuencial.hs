-- 30. Programe el algoritmo de búsqueda secuencial usando recursividad.

l :: [Int] = [1, 3, 5, 7, 11, 13, 17, 19]

bi1 :: [Int]->Int->Int->Int
bi1 (x:xs) e i
    |   null xs = error "No se encontró el elemento."
    |   e == x = i
    |   otherwise = bi1 xs e (i + 1)

be1 :: [Int]->Int->Int->Int
be1 (x:xs) i c
    |   null xs = error "No se encontró el elemento."
    |   c == i = x
    |   otherwise = be1 xs i (c + 1)

buscarIndice :: [Int]->Int->Int
buscarIndice l e = bi1 l e 0

buscarElemento :: [Int]->Int->Int
buscarElemento l i = be1 l i 0

main :: IO()

main = do

    putStrLn $ "Buscar en la lista "++show l ++ "\n 1. Indice por elemento\n 2. Elemento por índice"
    input <- getLine
    let op = read input::Int

    if op == 1
        then do
            putStrLn "\nIngrese el elemento a buscar:"
            input <- getLine
            let e = read input::Int
            putStrLn $ "Resultado de la búsqueda: "++show (buscarIndice l e)
    else if op == 2
        then do
            putStrLn "\nIngrese el índice del elemento a buscar:"
            input <- getLine
            let i = read input::Int
            putStrLn $ "Resultado de la búsqueda: "++show (buscarElemento l i)
    else putStrLn "\nOpción inválida."