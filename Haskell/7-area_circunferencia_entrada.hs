-- 7. Se desea obtener el área de una circunferencia mediante una función que
-- reciba el radio. Ingresar el dato por teclado.

areaC :: Double->Double
areaC r = pi*r^2

main :: IO()

main = do

    putStrLn "Ingrese el radio:"
    input <- getLine
    let r = read input::Double

    putStrLn $ "El área de la circunferencia es: pi*"++show r ++ "^2 = "++show (areaC r)