-- 8. Se nos pide calcular el volumen de un cilindro mediante una función que
-- reciba el radio de la circunferencia de la base y la altura. La fórmula para
-- calcular el volumen es: 𝑉 = 𝐴𝑐𝑖𝑟𝑐 ∗ ℎ y para calcular el área de la
-- circunferencia la fórmula es pi*r^2

volumenC :: Double->Double->Double

volumenC r h = (pi*r^2)*h

main :: IO()

main = do

    putStrLn "Ingrese el radio de la circunferencia:"
    input <- getLine
    let r = read input::Double

    putStrLn "Ingrese la altura del cilindro:"
    input <- getLine
    let h = read input::Double

    putStrLn $ "El volumen del cilindro con radio "++show r ++ " y altura "++show h ++ " es: "++show (volumenC r h)