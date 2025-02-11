-- 21. Desarrollar una función que indique cuantos dígitos tiene un número
-- determinado.

d1 :: Int->Int->Int
d1 n c
    |   n == 0 && c /= 0 = c
    |   n == 0 && c == 0 = 1
    |   otherwise = d1 (n `quot` 10) (c+1)

digitos :: Int->Int
digitos n = (d1 n 0)

main :: IO()

main = do
    
    putStrLn "Ingrese un número:"
    input <- getLine
    let n = read input::Int

    putStrLn $ "El número "++show n ++ " tiene "++show (digitos n) ++ " dígitos."