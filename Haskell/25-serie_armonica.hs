-- 25. Calcular el resultado de la siguiente serie:
-- 1 + 1/2 + 1/3 + ... + 1/n

s1 :: Double->Double->Double->Double
s1 n c r
    |   n == c = r
    |   n == 0 = s1 n 1 1
    |   otherwise = s1 n (c + 1) (r + (1/(c + 1)))

serie :: Double->Double
serie n = s1 n 0 0

main :: IO()

main = do

    putStrLn "Ingrese un número:"
    input <- getLine
    let n = read input::Double

    putStrLn $ "El resultado de la serie es: "++show (serie n)