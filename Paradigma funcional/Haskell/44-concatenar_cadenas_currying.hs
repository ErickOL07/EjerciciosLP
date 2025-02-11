-- 44. Utilice un esquema parecido al utilizado en la pregunta de la sumatoria de
-- tres números enteros a fin de hacer un programa que concatene tres cadenas
-- usando Currying. Puede usar la función string-append como el siguiente
-- ejemplo: (string-append "Apple" "Banana") para concatenar sus cadenas.

stringAppend :: String -> (String -> (String -> String))
stringAppend = \x -> \y -> \z -> x ++ y ++ z

main :: IO()

main = do
    putStrLn "Ingrese 3 palabras:"
    p1 <- getLine
    p2 <- getLine
    p3 <- getLine

    let r = (((stringAppend p1) p2) p3)

    putStrLn $ ""++show p1 ++ " + "++show p2 ++ " + " ++ show p3 ++ " = "++show r