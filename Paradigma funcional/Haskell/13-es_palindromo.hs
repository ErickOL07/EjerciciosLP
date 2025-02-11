-- 13. Escriba una función que permita determinar si una palabra es palíndroma o
-- no. Busque cómo utilizar la función reverse.

palindromo :: String->String

palindromo p
    |   reverse p == p = "La palabra es palíndroma."
    |   otherwise = "La palabra no es palíndroma."

main :: IO()

main = do

    putStrLn "Ingrese una palabra:"
    input <- getLine
    
    putStrLn (palindromo input)