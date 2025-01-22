-- 31. Realice un programa que eleve al cuadrado los elementos de una lista, se
-- recomienda colocar los elementos en una nueva lista

l :: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

listaCuadrado :: [Int]->[Int]->[Int]
listaCuadrado [] l2 = l2
listaCuadrado (x:xs) l2 = listaCuadrado xs (l2 ++ [x^2])

main :: IO()

main = do

    putStrLn $ "Lista 1: "++show l

    let lista2 = listaCuadrado l []

    putStrLn $ "\n\nNueva lista llena: "++show lista2 ++ "\nLista 1: "++show l