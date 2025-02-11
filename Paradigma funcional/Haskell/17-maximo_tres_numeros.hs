-- 17. Considere tres números enteros, realice una función que imprima cual de esos
-- números es el mayor.

mayor :: Int->Int->Int->Int

mayor n1 n2 n3
    |   (n1 >= n2) && (n1 >= n3) = n1
    |   (n2 >= n1) && (n2 >= n3) = n2
    |   otherwise = n3

main :: IO()

main = do

    putStrLn "Ingrese 3 números:"
    input <- getLine
    let n1 = read input::Int
    input <- getLine
    let n2 = read input::Int
    input <- getLine
    let n3 = read input::Int

    putStrLn $ "El mayor de los 3 números es "++show (mayor n1 n2 n3)