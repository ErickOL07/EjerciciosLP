-- 12. Un año se dice que es bisiesto si es su representación numérica da una división
-- exacta cuando es divisble por 4 y no por 100 al mismo tiempo o si es divisible
-- entre 400. Haga un programa que Haskell que permita determinar si un año
-- es bisiesto.

bisiesto :: Int->Bool

bisiesto n
    |   (n `mod` 4 == 0) && (n `mod` 100 /= 0) = True
    |   n `mod` 400 == 0 = True
    |   otherwise = False

main :: IO()

main = do

    putStrLn "Ingrese un año:"
    input <- getLine
    let n = read input::Int

    putStrLn $""++show (bisiesto n)

    if bisiesto n
        then putStrLn "Es bisiesto."
    else
        putStrLn "No es bisiesto."