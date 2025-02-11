-- 22. Se nos solicita desarrollar un programa que, mediante una función, devuelva
-- la sumatoria de los dígitos que constituyen un número. Por ejemplo, si
-- ingresamos el número 154, el programa deberá imprimir la sumatoria de
-- 1+5+4=10.

s1 :: Int->Int->Int
s1 n s
    |   n == 0 = s
    |   otherwise = s1 (n `quot` 10) (s + (n `rem` 10))

sumDig :: Int->Int
sumDig n = s1 n 0

main :: IO()

main = do
    
    putStrLn "Ingrese un número:"
    input <- getLine
    let n = read input::Int

    putStrLn $ "La suma de dígitos del número "++show n ++ " es "++show (sumDig n) ++ "."