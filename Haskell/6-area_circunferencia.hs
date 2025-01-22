-- 6. Se desea obtener el área de una circunferencia mediante una función que
-- reciba el radio.

areaC :: Double->Double
areaC r = pi*r^2

main :: IO()

main = do

    putStrLn "Ingrese el valor del radio:"
    input <- getLine
    let r = read input :: Double

    putStrLn $ "\nEl área de la circunferencia es pi*"++show (r) ++ "^2 = "++show (areaC r)