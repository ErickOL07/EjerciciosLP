-- 43. Defina una función que permita elevar un número a una potencia
-- determinada. Utilice currying para que se llame cada función con un solo
-- argumento a la vez; algo parecido a:
-- (define square (curry-power 2))
-- (square 3)
-- Nota: En su programa puede usar la instrucción expt.

curryPower :: Int -> (Int -> Int)
curryPower = \exponente -> \base -> (base^exponente)

main :: IO()

main = do

    putStrLn "Ingrese la base:"
    input <- getLine
    let b = read input::Int

    putStrLn "Ingrese el exponente:"
    input <- getLine
    let e = read input::Int

    let r = ((curryPower e) b)

    putStrLn $ ""++show b ++ "^"++show e ++ " = "++show r