-- 4. De forma similar al problema anterior realice un convertor de libras a
-- kilogramos, recordar que una libra es igual a 0.45 kilogramos.

convLb :: Double->Double

convLb lb = lb*0.45

main :: IO()

main = do

    putStrLn "Ingrese la cantidad de libras: "
    input <- getLine

    let n = read input::Double

    putStrLn $ show n ++ "lb son "++show (convLb n) ++ "kg."