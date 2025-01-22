-- 16. Escriba un programa en Haskell que lea una nota por teclado, de 0 a 100, y
-- que luego escriba su equivalente en letras según la siguiente escala:
-- A: 90-100
-- B: 80-89
-- C: 70-79
-- D: 60-69
-- F: Menor a 60

main :: IO()

main = do

    putStrLn "Ingrese un número del 0 al 100:"
    input <- getLine
    let n = read input::Int

    if n >= 90 && n <= 100
        then putStrLn "A"
    else if n >= 80 && n <= 89
        then putStrLn "B"
    else if n >= 70 && n <= 79
        then putStrLn "C"
    else if n >= 60 && n <= 69
        then putStrLn "D"
    else if n >= 0 && n < 60
        then putStrLn "F"
    else
        putStrLn "El número debe ser de 0 a 100"
