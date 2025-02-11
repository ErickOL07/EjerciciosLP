-- 14. Para calcular el área de un triángulo se puede utilizar la fórmula de Herón
-- que es la siguiente: 𝑎 = √𝑠(𝑠 − 𝑎)(𝑠 − 𝑏)(𝑠 − 𝑐) donde 𝑠 es el semiperímetro
-- del triángulo. El inconveniente es que para usar esta fórmula se debe de
-- cumplir la llamada desigualdad triangular. La desigualdad triangular
-- especifica que la sumatoria de dos lados de un triángulo debe de ser mayor que 
-- ael otro lado. Usando estos conceptos realice una función que verifique primero
-- si es que se cumple la desigualdad triangular y que luego proceda a calcular
-- el área de un triángulo.

heron :: Double->Double->Double->Double

heron a b c
    |   ((a + b > c) == True && (a + c > b) == True && (b + c > a)) == False = -1
    |   otherwise = sqrt(((a + b + c)/2)*(((a + b + c)/2) - a)*(((a + b + c)/2) - b)*(((a + b + c)/2) - c))

main :: IO()

main = do

    putStrLn "Ingrese la longitud de cada lado del triángulo:"
    input <- getLine
    let a = read input::Double
    input <- getLine
    let b = read input::Double
    input <- getLine
    let c = read input::Double

    if (heron a b c) == -1
        then putStrLn "No se cumple con la desigualdad triangular."
    else
        putStrLn $ "El área del triángulo con la fórmula de Herón es:\n √["++show ((a + b + c)/2) ++ "*("++show ((a + b + c)/2) ++ " - "++show a ++ ")*("++show ((a + b + c)/2) ++ " - "++show b ++ ")*("++show ((a + b + c)/2) ++ " - "++show c ++ ")] = "++show (heron a b c)