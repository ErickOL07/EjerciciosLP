-- 40. Realice una función que invierta los dígitos de un número. Trate de usar let
-- para almacenar el residuo de un número al ser dividido entre 10 en una
-- variable, y lambda en su solución.
-- Nota: En esta solución puede almacenar los dígitos en una lista.
-- div: cociente hacia abajo
-- rem: residuo (signo dividendo)
-- quot: cociente hacia 0
-- mod: residuo (signo divisor)

main :: IO()

extraerDig :: Int -> [Int]
extraerDig n
    |   n < 10 && n > -10 = [n]
    |   n < 0 = ((-n) `mod` 10)*(-1) : extraerDig (((-n) `div` 10)*(-1))
    |   otherwise = (n `mod` 10) : extraerDig (n `div` 10)

-- Creo una HOF
recorrer :: (Int -> Int -> Int) -> Int -> [Int] -> Int
recorrer funcion c [] = c
recorrer funcion c (x:xs) = recorrer funcion (funcion c x) xs

main = do

    putStrLn "Ingrese un número:"
    input <- getLine
    let n = read input::Int

    let l = extraerDig n

    print l

    let l2 = recorrer (\n2 x -> n2*10 + x) 0 l

    putStrLn $ "Número "++show n ++ " invertido: "++show l2