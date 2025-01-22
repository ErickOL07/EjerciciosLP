-- 5. Realice un programa que permita obtener una mini calculadora que realice
-- las operaciones aritméticas fundamentales de suma, resta, multplicación y
-- división

import System.Process (callCommand)

adicion :: Double->Double->Double
adicion a b = a + b

sustraccion :: Double->Double->Double
sustraccion a b = a - b

multiplicacion :: Double->Double->Double
multiplicacion a b = a*b

division :: Double->Double->Double
division a b = a/b

main :: IO()

main = do

    putStrLn "Seleccione la operación a realizar:\n1. Adición\n2. Sustracción\n3. Multiplicación\n4. División"
    input <- getLine
    let opc = read input :: Int

    putStrLn $ show (opc)
    callCommand "cls"

    putStrLn "Indique el primer número:"
    input <- getLine
    let n1 = read input :: Double
    putStrLn "Indique el segundo número:"
    input <- getLine
    let n2 = read input :: Double

    if opc == 1
        then putStrLn $ show (n1) ++ " + "++show (n2) ++ " = "++show (adicion n1 n2)
    else if opc == 2
        then putStrLn $ show (n1) ++ " - "++show (n2) ++ " = "++show (sustraccion n1 n2)
    else if opc == 3
        then putStrLn $ show (n1) ++ "*"++show (n2) ++ " = "++show (multiplicacion n1 n2)
    else if opc == 4
        then putStrLn $ show (n1) ++ "/"++show (n2) ++ " = "++show (division n1 n2)
    else
        putStrLn "No se seleccionó ninguna operación válida."