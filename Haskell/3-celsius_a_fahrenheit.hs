-- 3. Realice un programa que permita la conversión de grados C a grados F según
-- la siguiente fórmula:
-- F = C*9/5 + 32

convF :: Double->Double

convF c = c*9/5 + 32

main :: IO()

main = do
    
    putStrLn "Ingrese el valor en grados C: "
    input <- getLine

    let n1 = read input::Double

    putStrLn $ show (n1) ++ " grados C = "++show (convF n1) ++ " grados F"