-- 1. Obtener una lista con los números pares del 2 al 10, use list comprehension.

main :: IO()

main = do
    let pares = [x | x <- [2..10], even x]

    putStrLn $ "Pares: "++show pares