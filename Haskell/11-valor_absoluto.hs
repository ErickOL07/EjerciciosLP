-- 11. Realice un programa que imprima el valor absoluto de un número.

abs1 :: Int->Int

abs1 n
    |   n < 0 = -n
    |   otherwise = n

main :: IO()

main = do
    
    putStrLn "Ingrese un número:"
    input <- getLine
    let n = read input::Int

    putStrLn $ "|"++show n ++ "| = "++show (abs1 n) ++ "\ncon abs: abs("++show n ++ ") = "++show (abs n)