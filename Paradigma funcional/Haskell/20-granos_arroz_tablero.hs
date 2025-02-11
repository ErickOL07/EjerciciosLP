-- 20. Programar una función que permita obtener una solución al clásico problema
-- de los granos de arroz distribuidos en un tablero de ajedrez. En este problema
-- se coloca un grano de arroz en la primera casilla de un tablero de ajedrez,
-- dos granos en la segunda, 4 granos en la tercera y así sucesivamente; de tal
-- manera que cada casilla contenga el doble de granos de arroz de la casilla
-- anterior. Su programa deberá imprimir cuantos granos de arroz se
-- necesitarían hasta llenar una casilla determinada por el usuario.

g1 :: Int->Int->Int->Int
g1 n g c
    |   n == c = g 
    |   otherwise = g1 n (g*2) (c+1)

granos :: Int->Int
granos n = g1 n 1 1

main :: IO()

main = do

    putStrLn "Ingrese el número de casillas:"
    input <- getLine
    let n = read input::Int

    putStrLn $ "El número de granos necesarios para llenar "++show n ++ " casillas es "++show (granos n) ++ "."