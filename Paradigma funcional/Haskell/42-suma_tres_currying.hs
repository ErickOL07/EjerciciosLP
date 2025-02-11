-- 42. Realizar la suma de tres números usando una función suma que use curry.
-- En sí su función debiera permitir hacer algo como lo siguiente:
-- funcion(x,y,z)
-- return x+y+z
-- pero usando funciones lambda y Currying. Por ejemplo, si ingresa:
-- (((curried-sum3 1) 2) 3)
-- su programa deberá devolver el valor de 1+2+3, es decir 6.

curriedSum3 :: Int -> (Int -> (Int -> Int))
curriedSum3 = \x -> \y -> \z -> x + y + z

main :: IO()

main = do
    putStrLn "Ingrese 3 números:"
    input <- getLine
    let n1 = read input::Int
    input <- getLine
    let n2 = read input::Int
    input <- getLine
    let n3 = read input::Int

    let resultado = (((curriedSum3 n1) n2) n3)

    putStrLn $ ""++show n1 ++ " + "++show n2 ++ " + " ++ show n3 ++ " = "++show resultado