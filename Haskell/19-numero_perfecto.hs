-- 19. Desarrollar una función recursiva que permita determinar si un número es
-- perfecto. Un número es perfecto cuando la sumatoria de sus divisores,
-- exceptuando al mismo número, da el número que se desea evaluar. Por
-- ejemplo, el número 6 tiene como divisores 1,2,3 y 6; sumando los primeros
-- números tendríamos: 6=1+2+3.
-- div: cociente hacia abajo
-- rem: residuo (signo dividendo)
-- quot: cociente hacia 0
-- mod: residuo (signo divisor)

divs :: Int->Int->Int->Int
divs n d c
    |   d == 0 = c
    |   n `rem` d == 0 = divs n (d-1) (c+d)
    |   otherwise = divs n (d-1) c

perfecto :: Int->String
perfecto n
    |   divs n (n-1) 0 == n = "El número es perfecto"
    |   otherwise = "El número no es perfecto"

main :: IO()

main = do

    putStrLn "Ingrese un número:"
    input <- getLine
    let n = read input::Int

    putStrLn (perfecto n)