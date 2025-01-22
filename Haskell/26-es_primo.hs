-- 26. Realizar un programa que permita determinar si un número es primo.

p1 :: Int->Int->Int->String
p1 n r c
    |   (n `rem` r) == 0 && (c + 1 == 2) && (r - 1 == 0) = "El número es primo."
    |   (n `rem` r) == 0 = p1 n (r - 1) (c + 1)
    |   c > 2 = "El número no es primo."
    |   otherwise = p1 n (r - 1) c

esPrimo :: Int->String
esPrimo n = p1 n n 0

main :: IO()

main = do

    putStrLn "Ingrese un número:"
    input <- getLine
    let n = read input::Int

    putStrLn (esPrimo n)