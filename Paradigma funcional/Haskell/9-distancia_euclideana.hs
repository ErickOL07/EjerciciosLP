-- 9. Hacer un programa que permita recibir las coordenadas de dos puntos, su
-- programa deberá devolver la distancia euclideana entre estos dos puntos.
-- d = √((x2 - x1)² + (y2 - y1)²)

distancia :: Double->Double->Double->Double->Double

distancia x1 y1 x2 y2 = sqrt((x2 - x1)^2 + (y2 - y1)^2)

main :: IO()

main = do

    putStrLn "Ingrese las coordenadas del primer punto:"
    input <- getLine
    let x1 = read input::Double
    input <- getLine
    let y1 = read input::Double

    putStrLn "Ingrese las coordenadas del segundo punto:"
    input <- getLine
    let x2 = read input::Double
    input <- getLine
    let y2 = read input::Double

    putStrLn $ "La distancia euclidiana entre los puntos ("++show x1 ++ ";"++show y1 ++ ") y ("++show x2 ++ ";"++show y2 ++") es:\nd = "++show (distancia x1 y1 x2 y2)