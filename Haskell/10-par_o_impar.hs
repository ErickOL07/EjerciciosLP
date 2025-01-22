-- 10. Escribir un programa que pida ingresar un número y devuelva si es par o
-- impar. Usar función even de Haskell.

esPar :: Int->String

esPar n
    |   even n = "El número es par"
    |   otherwise = "El número es impar"

main :: IO()

main = do

    putStrLn "Ingrese un número:"
    input <- getLine
    let n = read input::Int

    putStrLn $ (esPar n)