-- 24. Calcular el resultado de la siguiente sumatoria: 1 + 2 + 3 … + 𝑛 usando
-- recursividad simple y tail recursión.

s1 :: Int->Int->Int->Int
s1 n c r
    |   c == n = r
    |   otherwise = (s1 n (c+1) (r+c))

suma :: Int->Int
suma n = (s1 n 0 0)

main :: IO()

main = do

    putStrLn "Ingrese un número:"
    input <- getLine
    let n = read input::Int

    putStrLn $ "El resultado de la sumatoria es: "++show (suma n)
    