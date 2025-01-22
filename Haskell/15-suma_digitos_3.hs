-- 15. Desarrollar una función que dado un número de tres dígitos nos imprima la
-- sumatoria de estos dígitos.

sumDig :: Int->Int
sumDig n
    |   n == 0 = 0
    |   otherwise = (n `rem` 10) + sumDig (n `quot` 10)

main :: IO()

main = do

    putStrLn "Ingrese un número de 3 dígitos:"
    input <- getLine
    let n = read input::Int

    putStrLn $ "La suma de los dígitos es: "++show (sumDig n)